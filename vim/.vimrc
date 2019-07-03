set nocompatible              " Enables vim specific features

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'gagoar/stripwhitespaces'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'raimondi/delimitmate'
Plugin 'leafgarland/typescript-vim'
"Plugin 'prettier/vim-prettier'

call vundle#end()

set t_Co=256
colorscheme DimGrey

" Nerdtree specs
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" JSBeautify specs
autocmd BufWritePre *.js :call JsBeautify()
"autocmd BufWritePre *.css :call CSSBeautify()
autocmd BufWritePre *.html :call HtmlBeautify()
autocmd BufWritePre *.json :call JsonBeautify()
"autocmd BufWritePre *.ts :call JsBeautify()
"autocmd BufWritePre *.ts :Prettier

filetype off                  " reset file detection
filetype indent plugin on

syntax enable

" typescript config
let g:typescript_indent_disable = 1
" number of spaces per indentation level
" " Prettier default: 2
"let g:prettier#config#tab_width = 4
" single quotes over double quotes
" " Prettier default: false
"let g:prettier#config#single_quote = "false"
" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" " Prettier default: babylon
"let g:prettier#config#parser = "flow"

set number " Show ling numbers
set hidden "allows to keep undo history, switch files without saving
set wildmenu "better command line completion
set showcmd " show me what I am typing show partial commands in the last line of the screen
set ignorecase "use search case insensitve save execept when using captials
set smartcase
set backspace=indent,eol,start "Makes backspace key more powerful.
set autoindent "Enable autoindent
set laststatus=2 "always display the status line
set mouse=a "enable mouse for all modes
set cmdheight=2 "set command window height to 2
set relativenumber " move to lines with ease"

set confirm

" from https://github.com/fatih/vim-go-tutorial/blob/master/vimrc

set ttyscroll=3 "speed up scrolling
set incsearch "Shows the match while typing
set hlsearch "Highlight found searches
set noerrorbells "No beeps

set autowrite "Won't have to save the file after calling :GoBuild

""""""""""""""""
" Mappings     "
"""""""""""""""
imap jk <esc>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap tt :tabnew <cr>
nnoremap nt :NERDTreeToggle <cr>
nnoremap tn :tabNext <cr>
nnoremap xx <esc> :call JsBeautify() :w <CR>

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)


let g:go_version_warning = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_operators = 1
"let g:go_metalinter_autosave = 1

let delimitMate_expand_cr=1
"map leader /"

"Will show the autocomplete options with every key stroke
"function! OpenCompletion()
""	if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
""	         call feedkeys("\<C-n>", "n")
""	endif
"endfunction
"autocmd InsertCharPre * call OpenCompletion()
"set completeopt=menuone,noselect,noinsert
