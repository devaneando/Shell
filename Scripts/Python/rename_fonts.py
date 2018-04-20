#!/usr/bin/env python
import os
import sys
from subprocess import Popen,PIPE,STDOUT

import optparse
usage = 'usage: %prog [options]'
parser = optparse.OptionParser(
    usage=usage)
parser.add_option('-p', '--path', dest='path',
                  default='.',
                  help='path to font dir',
                  metavar='PATH')
parser.add_option('-x', dest='execute',
                  action='store_true',
                  default=False,
                  help='execute',
                  )
(opt, args) = parser.parse_args()

def uniquify(path,sep='_'):
    path=os.path.normpath(path)
    num=0
    newpath=path
    idx=path.find('.')
    if idx>0:
        part1=path[:idx]
        part2=path[idx:]
    else:
        part1=path
        part2=''
    while os.path.isdir(newpath) or os.path.isfile(newpath):
        newpath=part1+sep+str(num)+part2
        num+=1
    return newpath

def standardize_name(astr):
    astr=astr.replace('\\','')
    astr=astr.replace(' ','_')
    return astr

cmd='fc-cat -v'
proc=Popen(cmd, shell=True, stdout=PIPE, stderr=open('/dev/null'))
output=proc.communicate()[0].split('\n')
filenames=[]
newnames=[]
for line in output:

# A line looks like this:
# "Phetsarath_OT.ttf" 0 "Phetsarath OT:familylang=en:style=Regular:stylelang=en:fullname=Phetsarath OT:fullnamelang=en:slant=0:weight=80:width=100:foundry=unknown:index=0:outline=True:scalable=True:charset=  |>^1!|>^1!P0oWQ |>^1!|>^1!|>^1!!!!%# !!71$!#>r1F3y?4!!K?&   !!!)$      )KG/~ !!!.%   9WIlj    !!!Q3    {y]9#8?/cS5fQdN !!#0GM>T@D#y#fx   !!#eW  !!#3H !!!!&      !!#AL      !!!W5 :lang=aa|ast|ay|bi|br|ch|co|da|de|en|es|et|eu|fi|fj|fo|fr|fur|fy|gd|gl|gv|ho|ia|id|ie|io|is|it|lb|lo|mg|nb|nds|nl|nn|no|nr|nso|oc|om|pt|rm|sma|smj|so|sq|ss|st|sv|sw|tn|ts|vo|vot|wa|xh|yap|zu:fontversion=65536:capability=otlayout\\:lao :fontformat=TrueType:decorative=False"

    if line.startswith('"'):
        row=line.split('"')
        filename,num,info_str=row[1],row[2],row[3]
        _,ext=os.path.splitext(filename)
        info_list=info_str.split(':')
        common_name=info_list[0]
        if common_name=='.dir':
            continue
        full_name=None
        style=None
        filenames.append(filename)
        for info in info_list:
            if info.startswith('style='):
                style=info.replace('style=','')
            if info.startswith('fullname='):
                full_name=info.replace('fullname=','')
                full_name=full_name.split(',')[0]
        if full_name:
            if full_name.startswith(common_name):
                newname=standardize_name('%s%s'%(full_name,ext))
            else:
                newname=standardize_name('%s_%s%s'%(common_name,full_name,ext))
        elif style:
            newname=standardize_name('%s_%s%s'%(common_name,style,ext))
        else:
            newname=standardize_name('%s%s'%(common_name,ext))
        newnames.append(newname)

namedict=dict(zip(filenames,newnames))
os.chdir(opt.path)
filelist=os.listdir(opt.path)
errors=[]
for afile in filelist:
    try:
        print(afile,namedict[afile])
        if opt.execute:
            os.rename(afile,uniquify(namedict[afile]))
    except KeyError:
        errors.append(afile)

if errors:
    print('These files are left unchanged:')
    for error in errors:
        print(error)
