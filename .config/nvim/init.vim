set number
set relativenumber
set autoindent
set cc=80
set encoding=UTF-8
set noswapfile
set scrolloff=5
set cursorline
set showmatch

filetype indent on
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set softtabstop=4

call plug#begin()
	" Autocomplete
	Plug 'neovim/nvim-lspconfig'
	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'MunifTanjim/eslint.nvim'
	Plug 'bmatcuk/stylelint-lsp'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc-emmet'
	Plug 'tpope/vim-commentary'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

	" Appearance
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'rafi/awesome-vim-colorschemes'
"	Plug 'ryanoasis/vim-devicons'
	
	" Functional
	Plug 'tpope/vim-surround'
	Plug 'tc50cal/vim-terminal'
"	Plug 'terryma/vim-multiple-cursors'
	Plug 'preservim/tagbar'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'chrisbra/Colorizer'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'preservim/nerdtree' |
            \ Plug 'ryanoasis/vim-devicons'
	Plug 'justinmk/vim-sneak'
	Plug 'leafgarland/typescript-vim'
	Plug 'qpkorr/vim-bufkill'
	Plug 'lervag/vimtex'
call plug#end()

let g:airline_theme='jellybeans'
let g:tagbar_sort = 0
let g:sneak#label = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let python_highlight_all = 1
let g:coc_global_extensions = ['coc-pyright', 'coc-yaml', 'coc-json', 'coc-emmet', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-angular', 'coc-vimtex']
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:tex_flavor = 'latex'
let maplocalleader = ","
let g:colorizer_auto_color = 1

nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

tnoremap jj <C-\><C-n> 

nnoremap ,<space> :nohlsearch<CR>
nnoremap ,f <cmd>Telescope find_files<cr>
nnoremap ,g <cmd>Telescope live_grep<cr>
nnoremap ,n :NERDTreeFocus<CR>

map ,s <Plug>Sneak_s
map ,S <Plug>Sneak_S

imap jj <Esc>

map <C-c> :BD<CR>

colorscheme jellybeans

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
lua << EOF
require('telescope').load_extension('fzf')

local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup()

eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})

-- Stylelint format after save
require'lspconfig'.stylelint_lsp.setup{
  settings = {
    stylelintplus = {
      --autoFixOnSave = true,
      --autoFixOnFormat = true,
    }
  }
}
EOF
