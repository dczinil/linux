set nocompatible
set nowrap
set mouse=a
syntax on
set hidden
""Searching
set incsearch
set showcmd
set showmatch
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
""wild
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set cmdheight=2
set number
set numberwidth=1
set notimeout ttimeout ttimeoutlen=200
set expandtab
""Style
colorscheme gruvbox
let g:gruvbox_contrat_dark = "hard"
highlight Normal ctermbg=NONE
set laststatus=2
let NERDTreeQuitOnOpen=1 ""Close NerdTree when opening a new file
let mapleader=" "
      ""Vim-tag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

set noshowmode
set sw=2
set autoindent
set relativenumber
set clipboard=unnamedplus
so ~/.vim/plugins.vim
so ~/.vim/maps.vim
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
