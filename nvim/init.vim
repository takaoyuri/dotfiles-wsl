"dein settings {{{
if &compatible
	set nocompatible
endif

let g:dein#auto_recache=0
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'echo'

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" python3 path
" let g:python3_host_prog = expand('/usr/bin/python3')
" let g:python_host_prog = expand('/usr/bin/python2')

" なければgit clone
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#add('Shougo/dein.vim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/neomru.vim')
	call dein#add('Shougo/neoyank.vim')
	call dein#add('Shougo/context_filetype.vim')
	call dein#add('thinca/vim-quickrun')
	" call dein#add('Shougo/deoplete.nvim')
	" call dein#add('Shougo/deol.nvim')
	" call dein#add('Shougo/neco-syntax')
	" call dein#add('Shougo/defx.nvim')
	" if !has('nvim')
	" 	call dein#add('roxma/nvim-yarp')
	" 	call dein#add('roxma/vim-hug-neovim-rpc')
	" endif

	"Autocomplete
	call dein#add('neoclide/coc.nvim', {'build': 'yarn install'})

	" call dein#add('liuchengxu/vista.vim')

	" snippets
	call dein#add('SirVer/ultisnips')
	call dein#add('honza/vim-snippets')

	" textobj operator
	call dein#add('kana/vim-textobj-user')
	call dein#add('machakann/vim-textobj-delimited')
	call dein#add('kana/vim-operator-user')
	call dein#add('machakann/vim-sandwich')

	" git
	call dein#add('lambdalisue/gina.vim')

	" syntax check
	call dein#add('w0rp/ale')

	" javascript
	" call dein#add('ternjs/tern_for_vim', {'build': 'npm install', 'on_ft': ['html', 'javascript', 'vue']})
	" call dein#add('carlitux/deoplete-ternjs', {'depends': ['deoplete.nvim'], 'on_ft': ['html', 'javascript', 'vue']})
	call dein#add('othree/jspc.vim', {'on_ft': ['javascript', 'html', 'vue']})
	call dein#add('othree/yajs.vim', {'on_ft': ['javascript', 'html', 'vue']})
	call dein#add('sbdchd/neoformat')
	" call dein#add('Galooshi/vim-import-js', { 'build': 'npm install -g import-js' })
	" call dein#add('billyvg/deoplete-import-js')
	" call dein#add('heavenshell/vim-jsdoc')

	" vue
	call dein#add('posva/vim-vue', {'on_ft': ['javascript', 'vue']})

	" typescript
	call dein#add('Quramy/tsuquyomi', {'on_ft': 'typescript'})
	call dein#add('leafgarland/typescript-vim', {'on_ft': 'typescript'})

	" php
	call dein#add('StanAngeloff/php.vim', {'on_ft': 'php'})

	" html css
	call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'xhtml', 'php', 'vue']})
	call dein#add('othree/html5.vim', {'on_ft': ['html']})
	call dein#add('ap/vim-css-color', {'on_ft': ['html', 'css', 'javascript', 'sass', 'scss', 'vue']})

	" golang
	" call dein#add('zchee/deoplete-go', {'depends': ['deoplete.nvim'],'build': 'make', 'on_ft': 'go'})
	call dein#add('fatih/vim-go', {'on_ft': 'go'})

	" fish shell
	" call dein#add('dag/vim-fish', {'on_ft' : 'fish'})

	" toml
	call dein#add('cespare/vim-toml', {'on_ft': 'toml'})

	" UI etc
	" call dein#add('cohama/lexima.vim')
	call dein#add('chrisbra/Colorizer')
	" call dein#add('haya14busa/vim-asterisk')
	" call dein#add('haya14busa/incsearch.vim')
	call dein#add('easymotion/vim-easymotion')
	call dein#add('thinca/vim-zenspace')
	call dein#add('ntpeters/vim-better-whitespace')
	call dein#add('tyru/caw.vim')
	" call dein#add('terryma/vim-multiple-cursors')
	" call dein#add('mg979/vim-visual-multi')
	" call dein#add('Yggdroot/indentLine')
	call dein#add('yuttie/comfortable-motion.vim')
	" call dein#add('rhysd/clever-f.vim')
	call dein#add('itchyny/lightline.vim')
	call dein#add('mgee/lightline-bufferline')
	call dein#add('machakann/vim-highlightedyank')
	call dein#add('mhinz/vim-startify')
	call dein#add('osyo-manga/vim-over')
	call dein#add('junegunn/fzf', {'build': './install --all'})
	call dein#add('andymass/vim-matchup')

	" colorscheme
	" call dein#add('rhysd/vim-color-spring-night')
	" call dein#add('rakr/vim-one')
	" call dein#add('itchyny/landscape.vim')
	" call dein#add('cocopon/iceberg.vim')
	" call dein#add('joshdick/onedark.vim')
	" call dein#add('ajmwagar/vim-deus')
	" call dein#add('nanotech/jellybeans.vim')
	" call dein#add('chriskempson/base16-vim')
	" call dein#add('nightsense/seabird')
	" call dein#add('NLKNguyen/papercolor-theme')
	" call dein#add('altercation/vim-colors-solarized')
	" call dein#add('lifepillar/vim-solarized8')
	call dein#add('rafi/awesome-vim-colorschemes')

	" matcher
	call dein#add('nixprime/cpsm', {'build' : 'env PY3=ON ./install.sh'})

	" Document generator
	call dein#add('kkoomen/vim-doge')

	" Ansible
	call dein#add('pearofducks/ansible-vim')

	" Splitjoin
	call dein#add('AndrewRadev/splitjoin.vim')

	call dein#end()
	call dein#save_state()

endif

if dein#check_install()
	call dein#install()
endif
" }}}

filetype plugin indent on
syntax enable

" Ultisnip
let g:UltiSnipsExpandTrigger="<C-j>"

" deoplete
" set completeopt=longest,preview
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_camel_case = 0
" let g:deoplete#enable_ignore_case = 0
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path = 1
" " let g:deoplete_import_js#bin = 'importjs'
"
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.html = '<[^>]*'
" let g:deoplete#omni_patterns.css   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.scss   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.sass   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
" let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"
" " let g:deoplete#sources = {}
" " let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
"
" call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
"
" javascript
" tern-vim
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']

" jsDoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1

" <TAB>: completion.
" inoremap <silent><expr> <TAB>
"			\ pumvisible() ? "\<C-n>" :
"			\ <SID>check_back_space() ? "\<TAB>" :
"			\ deoplete#manual_complete()
"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
     \ 'colorscheme': 'wombat',
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ],
     \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
     \ },
     \ 'component_function': {
     \   'cocstatus': 'coc#status',
     \ },
     \ }


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" multiple cursor and deoplete
" func! Multiple_cursors_before()
" 	if deoplete#is_enabled()
" 		call deoplete#disable()
" 		let g:deoplete_is_enable_before_multi_cursors = 1
" 	else
" 		let g:deoplete_is_enable_before_multi_cursors = 0
" 	endif
" endfunc
" func! Multiple_cursors_after()
" 	if g:deoplete_is_enable_before_multi_cursors
" 		call deoplete#enable()
" 	endif
" endfunc

" Leader to space key
let mapleader = "\<Space>"

" colorscheme
" set termguicolors
" let g:solarized_termtrans=0
set background=dark "light
colorscheme solarized8_high
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" colorscheme onedark

" allow buffer switching without saving
set hidden
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set noundofile
set showmatch
" always show tabline
set showtabline=2
set matchtime=1
set smartindent

set ignorecase
set smartcase
set incsearch
set hlsearch

set diffopt=internal,filler,algorithm:histogram,indent-heuristic

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" folding
" set foldenable
" set foldmethod=indent
" let php_folding=1 "PHP

" use clipboard
set clipboard=unnamedplus
set autoread
au CursorHold * checktime

"" insertモードrを抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

"" insertモードでカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" インサートモード時に非点滅の縦棒タイプのカーソル
let &t_SI .= "\e[6 q"
" ノーマルモード時に非点滅のブロックタイプのカーソル
let &t_EI .= "\e[2 q"
" 置換モード時に非点滅の下線タイプのカーソル
let &t_SR .= "\e[4 q"

" html
au BufRead,BufNewFile *.ihtml set filetype=html

" indentLine
set list lcs=tab:\|\ 
let g:indentLine_enable = 1
" let g:indentLine_newVersion = 1
" let g:indentLine_faster = 1
" let g:indentLine_setColors= 0
" let g:indentLine_color_term = 239
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 2
" let g:indentLine_color_tty_light = 4 " (default: 4)
" let g:indentLine_color_dark = 2 " (default: 2)

" lightline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[unnamed]'
let g:lightline = {
			\ 'colorscheme': 'solarized',
			\ 'tabline': {
			\ 'left': [['buffers']], 'right': [['close']]
			\},
			\ 'component_expand' : {
			\ 'buffers': 'lightline#bufferline#buffers'
			\},
			\ 'component_type' : {
			\ 'buffers': 'tabsel'
			\}
			\}
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" incsearch
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" vim-asterisk
map *   <Plug>(asterisk-*)

" caw.vim
nmap <C-_><C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_><C-_> <Plug>(caw:hatpos:toggle)

" Denite
let s:denite_winheight = 20
let s:denite_winrow = &lines > s:denite_winheight ? (&lines - s:denite_winheight) / 2 : 0
let s:denite_winwidth = &columns > 240 ? &columns / 2 : 120
let s:denite_wincol = &columns > s:denite_winwidth ? (&columns - s:denite_winwidth) / 2 : 0
call denite#custom#option('_', {
			\ 'cached_filter': v:true,
			\ 'cursor_shape': v:true,
			\ 'cursor_wrap': v:true,
			\ 'highlight_filter_background': 'DeniteFilter',
			\ 'highlight_matched_char': 'Underlined',
			\ 'matchers': 'matcher/fruzzy',
			\ 'prompt': '$ ',
			\ 'split': 'floating',
			\ 'start_filter': v:true,
			\ 'statusline': v:false,
			\ 'wincol': s:denite_wincol,
			\ 'winheight': s:denite_winheight,
			\ 'winrow': s:denite_winrow,
			\ 'winwidth': s:denite_winwidth,
			\ })

" denite filter buffer
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	imap <silent><buffer> jj <Plug>(denite_filter_quit)
	imap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
endfunction

" denite select buffer
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	let b:dwm_disabled = 1
	let b:auto_cursorline_disabled = 1
	nnoremap <silent><buffer> <C-j> j
	nnoremap <silent><buffer> <C-k> k
	nnoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
	nnoremap <silent><buffer><expr> <C-a>   denite#do_map('do_action', 'my_file_rec')
	nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
	nnoremap <silent><buffer><expr> <C-g>   denite#do_map('do_action', 'grep')
	nnoremap <silent><buffer><expr> <C-n>   denite#do_map('do_action', 'dwm_new')
	nnoremap <silent><buffer><expr> <C-x>   denite#do_map('do_action', 'quick_move')
	nnoremap <silent><buffer><expr> <C-v>   denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
	nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select).'j'
	nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
	nnoremap <silent><buffer><expr> a       denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q       denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
endfunction
" call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')
" call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
" call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')
" call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')
" call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>')
" call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
" call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>')
" call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>')
"
if executable('rg')
	call denite#custom#var('file/rec', 'command',
				\ ['rg', '--files', '--vimgrep', '--glob', '!git/*', '--glob', '!node_modules/*', '--follow', '--hidden', '--smart-case'])
	call denite#custom#var('grep', 'command', ['rg'])
	call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--vimgrep', '--no-heading'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
endif

	call denite#custom#source(
	\ 'file/rec', 'matchers', ['matcher/cpsm'])

" ctrlp
nnoremap <silent> <C-p> :<C-u>Denite file/rec<CR>
" cursor word grep
nnoremap <silent> ;cg :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
" grep
nnoremap <silent> ;g :<C-u>Denite -buffer-name=search -mode=normal grep<CR>
nmap <silent> <C-u><C-t> :<C-u>Denite filetype<CR>
nmap <silent> <C-u><C-c> :<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-u><C-g> :<C-u>Denite grep<CR>
nmap <silent> <C-u><C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <C-u><C-r> :<C-u>Denite -resume<CR>
nmap <silent> <C-u><C-d> :<C-u>call denite#start([{'name': 'file/rec', 'args': ['~/dotfiles']}])<CR>
nmap <silent> <C-u>; :<C-u>Denite -resume -immediately -select=+1<CR>
nmap <silent> <C-u>- :<C-u>Denite -resume -immediately -select=-1<CR>

" ale syntax check
let g:ale_fixers = {}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'vue': ['prettier'],
\   'html': ['prettier'],
\   'c': ['clang-format'],
\   'php': ['php_cs_fixer'],
\   'sql': ['pgformatter']
\}

let g:ale_lint_on_text_changed = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 2
let g:ale_sign_column_always = 1
let g:ale_sass_stylelint_use_global = 1
" let g:ale_fix_on_save = 1

" Splitjoin and ALEFix
noremap <silent> gs :SplitjoinSplit<CR>:ALEFix<CR>
noremap <silent> gj :SplitjoinJoin<CR>:ALEFix<CR>

" vue
autocmd FileType vue syntax sync fromstart
" let g:vue_disable_pre_processors=1
let g:vue_pre_processors = ['scss']
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" css
"* での検索や text-object 等での選択時に - で切らない
setlocal iskeyword& iskeyword+=-

" php
let php_sql_query = 1

"textobj
nmap s <Nop>
xmap s <Nop>

"sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
			\   {
			\     'buns'    : ['TagInput(1)', 'TagInput(0)'],
			\     'expr'    : 1,
			\     'filetype': ['html'],
			\     'kind'    : ['add', 'replace'],
			\     'action'  : ['add'],
			\     'input'   : ['t'],
			\   },
			\ ]

function! TagInput(is_head) abort
	if a:is_head
		let s:TagLast = input('Tag: ')
		if s:TagLast !=# ''
			let tag = printf('<%s>', s:TagLast)
		else
			throw 'OperatorSandwichCancel'
		endif
	else
		let tag = printf('</%s>', matchstr(s:TagLast, '^\a[^[:blank:]>/]*'))
	endif
	return tag
endfunction

if system('uname -a | grep Microsoft') != ""
	let g:clipboard = {
				\   'name': 'win32yank',
				\   'copy': {
				\      '+': 'win32yank -i',
				\      '*': 'win32yank -i',
				\    },
				\   'paste': {
				\      '+': 'win32yank -o',
				\      '*': 'win32yank -o',
				\   },
				\   'cache_enabled': 1,
				\ }
endif

"" encoding 
set encoding=utf-8

if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'

  " Does iconv support JIS X 0213 ?
  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213,euc-jp'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " Make fileencodings
  let &fileencodings = 'ucs-bom'
  if &encoding !=# 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'ucs-2le'
    let &fileencodings = &fileencodings . ',' . 'ucs-2'
  endif
  let &fileencodings = &fileencodings . ',' . s:enc_jis

  if &encoding ==# 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'cp932'
  elseif &encoding =~# '^euc-\%(jp\|jisx0213\)$'
    let &encoding = s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'cp932'
  else  " cp932
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
  endif
  let &fileencodings = &fileencodings . ',' . &encoding

  unlet s:enc_euc
  unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
" function! AU_ReCheck_FENC()
" 	if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
" 		let &fileencoding=&encoding
" 	endif
" endfunction
" autocmd BufReadPost * call AU_ReCheck_FENC()

