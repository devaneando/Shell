# [Created by task 2.5.1 11/21/2018 09:18:46]
# Taskwarrior program configuration file.
# For more documentation, see http://taskwarrior.org or try 'man task', 'man task-color',
# 'man task-sync' or 'man taskrc'

# Here is an example of entries that use the default, override and blank values
#   variable=foo   -- By specifying a value, this overrides the default
#   variable=      -- By specifying no value, this means no default
#   #variable=foo  -- By commenting out the line, or deleting it, this uses the default

# Use the command 'task show' to see all defaults and overrides

data.location                 =~/Things/Dropbox/Devaneando/Data/Todo
report.devaneando.columns     = id,description,tags
report.devaneando.description = My main list
report.devaneando.filter      = status:pending or status:waiting
report.devaneando.labels      = ID,Description, Tags
report.devaneando.sort        = description+

# Color theme (uncomment one to use)
#include /usr/share/taskwarrior/light-16.theme
#include /usr/share/taskwarrior/light-256.theme
#include /usr/share/taskwarrior/dark-16.theme
#include /usr/share/taskwarrior/dark-256.theme
#include /usr/share/taskwarrior/dark-red-256.theme
#include /usr/share/taskwarrior/dark-green-256.theme
#include /usr/share/taskwarrior/dark-blue-256.theme
#include /usr/share/taskwarrior/dark-violets-256.theme
include /usr/share/taskwarrior/dark-yellow-green.theme
#include /usr/share/taskwarrior/dark-gray-256.theme
#include /usr/share/taskwarrior/dark-gray-blue-256.theme
#include /usr/share/taskwarrior/solarized-dark-256.theme
#include /usr/share/taskwarrior/solarized-light-256.theme
#include /usr/share/taskwarrior/no-color.theme
#include /home/devaneando/Shell/App/Task/devaneando.theme
