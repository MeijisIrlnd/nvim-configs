syntax on 
set number 
set expandtab 
set autoindent
set shiftwidth=4
set smartindent
set nocompatible 
filetype plugin indent on 


call plug#begin('~/.config/nvim/autoload/plugged')
function! UpdateRemotePlugins(...)
    let &rtp = &rtp
    UpdateRemotePlugins
endfunction

Plug 'navarasu/onedark.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gelguy/wilder.nvim',{'do':function('UpdateRemotePlugins')}
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
call plug#end()
nmap <S-t> :NERDTreeFocus<CR>
" wilder setup
call wilder#setup({ 'modes': [':', '/', '?'] })
call wilder#set_option('renderer', wilder#popupmenu_renderer({
  \ 'highlighter': wilder#basic_highlighter(),
  \ 'left': [ ' ', wilder#popupmenu_devicons() ],
  \ 'right': [ ' ', wilder#popupmenu_scrollbar() ],
\ }))

" auto commands
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
lua require('plug')
