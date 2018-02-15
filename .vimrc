"       .vimrc  (sudo apt-get install vim)

"       activates filetype detection
"          plugin - plugin file is loaded (if there is one for the detected
"          filetype)
"          indent - indent file is loaded (if there is one for the detected
"          filetype). indent-expression
"          Each time a new or existing file is edited, Vim will try to
"          recognize the type of the file and set the 'filetype' option. This
"          will trigger the FileType event, which can be used to set the
"          syntax highlighting, set options, etc.
" filetype plugin indent on
:filetype plugin on
"       activates syntax highlighting among other things
:syntax on
"
:color murphy
"       show the line number column
" :set number
"       relative numbers can be enabled
" :set relativenumber
"       spell checking
" set spell
"       allows you to deal with multiple unsaved buffers simultaneously
"       without resorting to misusing tabs
" set hidden
"       just hit backspace without this one and see for yourself
" set backspace=indent,eol,start
~                                  
