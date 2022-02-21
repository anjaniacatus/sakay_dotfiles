set nocompatible
syntax enable
filetype plugin indent on
call plug#begin('~/.config/plugged')
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kien/ctrlp.vim'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'Chiel92/vim-autoformat'
Plug 'avdgaag/vim-phoenix'
Plug 'elixir-editors/vim-elixir'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot',
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'KarimElghamry/vim-auto-comment'
Plug 'tpope/vim-unimpaired'
Plug 'prettier/vim-prettier', {
                  \ 'do': 'yarn install',
                  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"setting html/js/json/css autoformat
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" setting autoformat
let g:python3_host_prog="/path/to/python/executable/"
" autoformat when saving a file
au BufWrite * :Autoformat
"javascript and elixir linting
let g:ale_linters = {'elixir': ['elixir-ls'],}
let g:ale_fixers = {'elixir': ['mix_format'], 'javascript': ['eslint']}
let g:ale_elixir_elixir_ls_release='~/.elixir-ls/release'
let g:vim_jsx_pretty_colorful_config = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
" commenting configuration
let g:autocomment_map_keys = 0
let g:default_inline_comment = '#'
let g:default_block_comment = '/*'
let g:inline_comment_dict = {
                  \'//': ["js", "ts", "cpp", "c", "dart"],
                  \'#': ['py', 'sh', 'exs', 'ex'],
                  \'"': ['vim'],
                  \}
let g:block_comment_dict = {
                  \'/*': ["js", "ts", "cpp", "c", "dart"],
                  \'"""': ['py'],
                  \'<!--': ['html']
                  \}
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
"navigating through error
noremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>af :ALEFix<cr>
noremap <Leader>ar :ALEFindReferences<CR>
" icons
set encoding=UTF-8
"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
" Fix files automatically on save
let g:ale_fix_on_save = 1
" inline indent
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
colorscheme nord
set number
set linebreak
set statusline=2
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set tabstop=2
set softtabstop=2
set expandtab
set showcmd
set cursorline
filetype indent on
set wildmenu
set incsearch
set hlsearch
set foldmethod=indent
set foldenable
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"remplacer mon ctrl+w
let mapleader=","
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.php Prettier
autocmd FileType elixir setlocal formatprg=mix\ format\ -
autocmd BufWritePre * :%s/\s\+$//e
let g:qf_modifiable = 1
autocmd User QfReplacementBufWritePost doautocmd BufWritePost
autocmd BufWinEnter * silent! :%foldopen!
cnoreabbrev Ack Ack!
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <Leader>a :Ack!<Space>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID> show_documentation()<CR>
nnoremap <silent> <leader> co :<C-u>Coclist outline<CR>
noremap <leader>n :NERDTreeToggle<cr>
noremap <C-w>- :split<cr>
noremap <C-w>\| :vsplit<cr>
nnoremap j gj
nnoremap k gk
nnoremap <leader>s :mksession<CR>
" elixir
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
" open ag.vim
nnoremap <leader>a :Ag
if isdirectory(argv(0))
      bd
      autocmd vimenter * exe "cd" argv(0)
      autocmd VimEnter * NERDTree
endif
let g:ctrlp_use_caching=0
autocmd FileType text setlocal textwidth=78
autocmd FileType markdown setlocal wrap
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType elixir setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2
autocmd FileType scss  setlocal shiftwidth=2 tabstop=2
autocmd FileType css   setlocal shiftwidth=2 tabstop=2
autocmd FileType html  setlocal shiftwidth=2 tabstop=2
autocmd FileType eco   setlocal shiftwidth=2 tabstop=2

function! <SID>StripTrailingWhitespaces()
      " save last search & cursor position
      let _s=@/
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      let @/=_s
      call cursor(l, c)
endfunction
function! ToggleNumber()
      if(&relativenumber == 1)
            set norelativenumber
            set number
      else
            set relativenumber
      endif
endfunction

