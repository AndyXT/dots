syntax on

let mapleader=" "
let maplocalleader="\\"

set background=dark
set nocompatible
set list
set number
set laststatus=2
set mouse=a
set termguicolors
set expandtab
set completeopt=menuone,noselect
set wildmenu
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set magic
set smartcase
set incsearch

set path+=**


let g:ale_virtualtext_cursor = 'none' 

call plug#begin()
	" plugins
	Plug 'morhetz/gruvbox'
	Plug 'lifepillar/vim-gruvbox8'
	Plug 'vim-airline/vim-airline'
	Plug 'jszakmeister/vim-togglecursor'
	Plug 'jmcantrell/vim-virtualenv'
	Plug 'tpope/vim-commentary'
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'sheerun/vim-polyglot'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ervandew/supertab'
	Plug 'w0rp/ale'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'yggdroot/indentline'
	Plug 'kien/ctrlp.vim'
	Plug 'slim-template/vim-slim'
	Plug 'stylelint/stylelint'
	Plug 'bmatcuk/stylelint-lsp'
	Plug 'jeffkreeftmeijer/vim-numbertoggle'
	Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
	Plug 'nlknguyen/copy-cut-paste.vim'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'liuchengxu/vim-which-key'
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'rhysd/vim-lsp-ale'
	Plug 'mattn/vim-lsp-settings'
	Plug 'Eliot00/git-lens.vim'
	Plug 'mbbill/undotree'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
	Plug 'skywind3000/asynctasks.vim'
	Plug 'skywind3000/asyncrun.vim'
	Plug 'liuchengxu/vista.vim'
	Plug 'tpope/vim-repeat'
	Plug 'tommcdo/vim-exchange'
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:asyncrun_open = 6

set termguicolors
let g:bargreybars_auto = 0

" 
colorscheme carbonfox
let g:gruvbox_termcolors=16

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Tabe ustom keymaps
nmap tn :tabn
nmap tp :tabp


" CCP custom keymaps
let g:copy_cut_paste_no_mappings = 1

nmap uy <Plug>CCP_CopyLine
vmap uy <Plug>CCP_CopyText

nmap uo <Plug>CCP_CutLine
vmap uo <Plug>CCP_CutText

nmap up <Plug>CCP_PasteText

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzf --ansi --no-multi")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

function! RgCommand(vim_command)
  try
    let term = input('PATTERN: ')
    let output = system("rg " . term . " . --color=always --line-number --column --colors 'path:none' --colors 'line:none' --colors 'column:none'" . " | fzf --ansi")
    " let output = system("rg " . "--color=never --line-number " . term . " ." . " | fzf")
    " let output_lines = systemlist("rg " . "--color=never --line-number " . term . " ." . " | fzf")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    " let parts = split(output, ':')
    " let output = substitute(output, '[^[:print:]\n]', '', 'g')
    " let output = substitute(output, '\n\+$', '', '')
    let matched = matchlist(output, '\v^(.*):(\d+):(\d+):')
    let file = matched[1]
    let file = substitute(file, '\', '/', 'g')
    let line = matched[2]
    let col = matched[3]
    exec a:vim_command . ' ' . fnameescape(file)
    " echo a:vim_command . ' ' . fnameescape(file)
    exec 'normal! ' . line . 'G' . col . '|'
  endif
endfunction

nnoremap <leader>e :call FzyCommand("fd . --color=always", ":e")<cr>
nnoremap <leader>v :call FzyCommand("fd . --color=always", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("fd . --color=always", ":sp")<cr>
nnoremap <leader>r :call RgCommand(":e")<cr>
nnoremap K :LspHover<cr>
