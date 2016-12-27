" ●▬▬▬▬▬๑۩ Detect files patterns ۩๑▬▬▬▬▬●

" Nginx patterns
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" Varnish VCL patterns
au BufRead,BufNewFile *.vcl set filetype=vcl

" Log files patterns
au BufNewFile,BufRead *.log set filetype=log