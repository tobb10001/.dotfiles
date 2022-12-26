call plug#begin('~/.local/share/nvim/site/autoload/')

" Coding Helpers
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
Plug 'sukima/xmledit' " HTML
Plug 'udalov/kotlin-vim'

" Quality of Life
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'simrat39/symbols-outline.nvim'

" Optics
Plug 'morhetz/gruvbox'

call plug#end()
