"       .vimrc  (sudo apt-get install vim)
"	.vimrc  3.538.810  2019-11-06T17:07:52.083722-06:00 (CST)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.537  
"	   added  set paste  to stop comments being added 
"	.vimrc	1.0.5	2018-02-15_10:51:02_CST uadmin four-rpi3b.cptx86.com  
"	   Inital commit of basic .vimrc settings 

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
set paste
