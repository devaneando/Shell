" ●▬▬▬▬▬๑۩ vim-better-whitespace ۩๑▬▬▬▬▬●

" Do not strip white spaces on diff files

let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']

" Defines a new group for the next commands
augroup WhitespaceOnSave

" Automatically clean white spaces on save
autocmd WhitespaceOnSave BufEnter    * EnableStripWhitespaceOnSave
autocmd WhitespaceOnSave BufReadPre  * EnableStripWhitespaceOnSave
autocmd WhitespaceOnSave BufNewFile  * EnableStripWhitespaceOnSave
autocmd WhitespaceOnSave FileReadPre * EnableStripWhitespaceOnSave


