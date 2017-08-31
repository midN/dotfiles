" VUNDLE

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" Autocomplete
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-rake'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'szw/vim-ctrlspace'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pearofducks/ansible-vim'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/tComment'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/syntastic'
Plugin 'chriskempson/base16-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'rking/ag.vim'
Plugin 'mhinz/vim-startify'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mcasper/vim-infer-debugger'
Plugin 'luochen1990/rainbow'
" Align stuff murdho-fagway
Plugin 'junegunn/vim-easy-align'

" Clojuuuuuuuuuuuuuuuuuuuuuuuuuure
Plugin 'guns/vim-sexp'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'

" GoLang
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" Leader
let mapleader = " "

" Search
let g:ag_prg = 'ag --vimgrep'
let g:ag_working_path_mode="r"

" Syntastic
let g:syntastic_javascript_checkers = ['jsxhint']

" Rainbow
let g:rainbow_active = 1

" Set commands
set nobackup
set nowritebackup
set noswapfile
set history=50
set showcmd
set incsearch
set laststatus=2
set autowrite
set encoding=utf-8
set nocompatible
set hidden
set expandtab
set pastetoggle=<F2>
set showmode
set tags=./tags;
set grepprg=ack
set clipboard=unnamed
set background=dark
set winwidth=84
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Make it obvious where 80 characters is
set colorcolumn=82
" Numbers
set number
set numberwidth=4
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Always use vertical diffs
set diffopt+=vertical
" Scroll past end / beginning
set scrolloff=5
set mouse=a
" Identation
set smartindent
set autoindent
filetype indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shell=zsh
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menuone,preview
" Search
set incsearch
set ignorecase
set smartcase
" Status
set laststatus=2
" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" Colorscehme
" if !has("gui_running")
"   let g:solarized_termtrans=1
"   let g:solarized_termcolors=256
" endif
" colorscheme solarized
colorscheme onedark

" Other stuff
syntax on
filetype on
scriptencoding utf-8
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
let g:ctrlp_working_path_mode = 0
highlight LineNr term=bold ctermbg=NONE ctermfg=white
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Comment ctermfg=green
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
let g:easytags_dynamic_files = 1

" Autocmd filetypes
au FileType * set fo-=r
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType ruby,python autocmd BufWritePre <buffer> :%s/\($\n\s*\)\+\%$//e
autocmd BufRead,BufNewFile ~/Projects/ansible_playbooks/* set ft=ansible
autocmd BufRead,BufNewFile ~/Projects/wallester/infrastructure/playbooks/* set ft=ansible
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile Dockerfile* set filetype=dockerfile
autocmd BufRead,BufNewFile Jenkinsfile* set filetype=groovy
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Remaps
nnoremap <leader>j :tabprevious<CR>
nnoremap <leader>k :tabnext<CR>
nnoremap <leader>t :tabnew<Space>
nnoremap <F2> :set invpaste paste?<CR>
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>. :CtrlPTag<cr>
noremap <Leader>rt :!ctags -R --languages=ruby --exclude=.git
      \ --exclude=log . $(Bundle list --paths)

" Pry / Debugger
map <Leader>d :call AddDebugger("o")<cr>
map <Leader>rd :call RemoveAllDebuggers()<cr>

" RSpec.vim mappings
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" Save current file
noremap <Leader>s :update<CR>

" Install vim plugis
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>

" Blame
nmap <Leader>b :Gblame<CR>

" Supertab / Autocomplete
inoremap <Tab> <C-P>

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Lightline plugin
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages =
    \ {'regex': 'character class has duplicated range\.*'}
let g:jira_url = 'https://inbank.atlassian.net'
let g:jira_username = 'andres.ivanov@inbank.ee'
let g:jira_password = '92andresiv'



set exrc
set secure

augroup project
      autocmd!
          autocmd BufRead,BufNewFile *.a,*.h,*.c set filetype=c.doxygen
        augroup END
augroup END
