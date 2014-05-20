" Lots of this stolen from https://github.com/kerryb/vim-config with a bunch of stuff I don't use removed and customisations

set nocompatible
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
colorscheme obsidian

let mapleader = ","

set history=1000 " Remember a decent way back
set laststatus=2 " Always show status line.
set nowrap " Line wrapping off
set number " line numbers
set ruler " Ruler on
set scrolloff=3 " More context around cursor

set autoindent
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" GVim Options
set guioptions-=T " no toolbar
set guioptions-=m " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars

" Search options
set hlsearch " highlight search matches...
set incsearch " ...as you type
" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only "The", while /the would find "the" or "The" etc. 
set ignorecase
set smartcase

" Always use 'very magic' regex for search and substitution
:nnoremap / /\v
:cnoremap %s/ %s/\v
:cnoremap s/ s/\v

" Autosave all buffers when focus lost or buffer changes
au FocusLost * :wa
set autowriteall

set statusline=%<%f\ %h%m%r%=%-20.(line=%l\ of\ %L,col=%c%V%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*

" Automatically turn on colorizers highlighting for some filetypes
let g:colorizer_auto_filetype='css,html,less,scss,vim'

" Don't auto open quickfix window for pymode
let g:pymode_lint_cwindow = 0
" Disable PEP8 by default as it complains about a lot of minor formatting
" issues
let g:pymode_lint_checkers = ['pyflakes', 'mccabe']
let g:pymode_rope_complete_on_dot = 0

" ----------------------------------------------
" Command Shortcuts
" ----------------------------------------------

" ,c to show hidden characters
"set listchars=tab:>-,trail:·,eol:$
"nmap <silent> <leader>c :set nolist!<CR>

" ,sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

" strip trailing whitespace<foo&bar>
"autocmd BufWritePre,FileWritePre * call StripTrailingWhitespace()
function! StripTrailingWhitespace()
    normal mz
    normal Hmy
    exec '%s/\s*$//g'
    normal 'yz<cr>
    normal `z
endfunction

" ----------------------------------------------
" Source any local config
" Keep this last to make sure local config overrides global!
" ----------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
