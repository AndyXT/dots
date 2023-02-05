syntax enable
filetype plugin on
let mapleader=" "
let maplocalleader="\\"

set path+=**

command! MakeTags !ctags -R .

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set termguicolors
set expandtab
set nohlsearch
set ignorecase
set smartcase
set wildmenu
set incsearch
set magic
set regexpengine=0
set ai
set si
colorscheme lunaperche
set number
set relativenumber
nnoremap <Leader>cc :set colorcolumn=80<cr>
nnoremap <Leader>ncc :set colorcolumn-=80<cr>
nnoremap K :LspHover<cr>
set mouse=a
set completeopt=menuone,noselect

set nocompatible
set laststatus=2
"set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ %=CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c\ (%p%%)

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>

nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>t<leader> :tabnext<cr>

inoremap <c-d> <esc>ddi
inoremap <c-y> <esc>yyi
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

augroup comment
    autocmd FileType rust nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
augroup END

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

packadd termdebug
packadd lsp
let lspServers = [
 	\     #{
 	\        filetype: ['c', 'cpp'],
 	\        path: '/usr/bin/clangd',
 	\        args: ['--background-index']
 	\      },
 	\     #{
 	\	     filetype: ['rust'],
 	\	     path: '/Users/andrestreto/.cargo/bin/rust-analyzer',
 	\	     args: [],
    \        syncInit: v:true
 	\      },
 	\   ]
call LspAddServer(lspServers)
