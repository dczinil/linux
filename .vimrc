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
set notimeout ttimeout ttimeoutlen=200
set expandtab
""Style
colorscheme gruvbox
let g:gruvbox_contrats_dark = "hard"
highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode
set relativenumber
set clipboard=unnamedplus
so ~/.vim/plugins.vim
"""so ~/.vim/plugin-config.vim
"""so ~/.vim/maps.vim
"""Remember cursor
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif