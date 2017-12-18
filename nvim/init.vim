"dein settings {{{
if &compatible
	set nocompatible
endif

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" set runtimepath+=~/.cache/dein/github.com/nixprime/cpsm

" なければgit clone
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#add('Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/neomru.vim')
	call dein#add('Shougo/neoyank.vim')
	call dein#add('Shougo/deol.nvim')
	call dein#add('Shougo/context_filetype.vim')
	call dein#add('Shougo/neco-syntax')
	call dein#add('thinca/vim-quickrun')

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
	call dein#add('ternjs/tern_for_vim', {'build': 'npm install', 'on_ft': ['javascript', 'html']})
	call dein#add('carlitux/deoplete-ternjs', {'depends': ['deoplete.nvim'], 'on_ft': ['javascript', 'html']})
	call dein#add('othree/jspc.vim', {'on_ft': ['javascript', 'html']})
	call dein#add('othree/yajs.vim', {'on_ft': ['javascript', 'html']})

	" php
	call dein#add('lvht/phpcd.vim', {'build': 'composer install', 'on_ft': 'php'})

	" html css
	call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'php']})
	call dein#add('othree/html5.vim', {'on_ft': ['html']})
	call dein#add('ap/vim-css-color', {'on_ft': ['html', 'css', 'javascript']})

	" golang
	call dein#add('zchee/deoplete-go', {'build': 'make', 'on_ft': 'go'})
	call dein#add('fatih/vim-go', {'on_ft': 'go'})

	" fish shell
	call dein#add('dag/vim-fish', {'on_ft' : 'fish'})

	" toml
	call dein#add('cespare/vim-toml', {'on_ft': 'toml'})

	" UI etc
	call dein#add('cohama/lexima.vim')
	call dein#add('chrisbra/Colorizer')
	call dein#add('haya14busa/vim-asterisk')
	call dein#add('haya14busa/incsearch.vim')
	call dein#add('easymotion/vim-easymotion')
	call dein#add('thinca/vim-zenspace')
	call dein#add('ntpeters/vim-better-whitespace')
	call dein#add('tyru/caw.vim')
	call dein#add('terryma/vim-multiple-cursors')
	call dein#add('Yggdroot/indentLine')
	call dein#add('yuttie/comfortable-motion.vim')
	call dein#add('rhysd/clever-f.vim')
	call dein#add('itchyny/lightline.vim')
	call dein#add('mgee/lightline-bufferline')
	call dein#add('machakann/vim-highlightedyank')
	call dein#add('mhinz/vim-startify')
	call dein#add('osyo-manga/vim-over')
	call dein#add('junegunn/fzf.vim')

	call dein#add('haya14busa/vim-gtrans', {'build': 'go get github.com/haya14busa/gtrans'})

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
	call dein#add('NLKNguyen/papercolor-theme')

	" matcher
	" call dein#add('nixprime/cpsm', {'build' : 'env PY3=ON ./install.sh'})

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
set completeopt=longest,preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#sources = get(g:, 'deoplete#sources', {})
" let g:deoplete#sources.php = ['phpcd', 'omni']
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#enable_camel_case = 0
" let g:deoplete#enable_ignore_case = 0
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#max_list = 10000
" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['phpcd', 'omni']
" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs']
"
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

" <TAB>: completion.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ deoplete#manual_complete()

function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <BS>: close popup and delete backword char.
" inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" multiple cursor and deoplete
function! Multiple_cursors_before()
	let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
	let b:deoplete_disable_auto_complete = 0
endfunction

" Leader to space key
let mapleader = "\<Space>"

set background=light
set termguicolors
colorscheme PaperColor

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
set hlsearch
" use clipboard
set clipboard=unnamed

"" insertモードrを抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

"" insertモードでカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


" if has('vim_starting')
	" インサートモード時に非点滅の縦棒タイプのカーソル
	let &t_SI .= "\e[6 q"
	" ノーマルモード時に非点滅のブロックタイプのカーソル
	let &t_EI .= "\e[2 q"
	" 置換モード時に非点滅の下線タイプのカーソル
	let &t_SR .= "\e[4 q"
" endif

" ihtml
au BufRead,BufNewFile *.ihtml set filetype=html

" indentLine
set list lcs=tab:\|\ 
let g:indentLine_enable = 1
let g:indentLine_newVersion = 0
let g:indentLine_faster = 0
let g:indentLine_setColors= 100
let g:indentLine_concealcursor="nc"
" let g:indentLine_color_term = 254
" let g:indentLine_color_term = 111
" let g:indentLine_color_gui = '#708090'

" lightline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline = {
			\ 'colorscheme': 'PaperColor',
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

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" vim-asterisk
map *   <Plug>(asterisk-*)

" caw.vim
nmap <C-_><C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_><C-_> <Plug>(caw:hatpos:toggle)

" Denite
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>')
" call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
" call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>')
" call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>')

" ctrlp
nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>
" cursor word grep
nnoremap <silent> ;cg :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
" grep
nnoremap <silent> ;g :<C-u>Denite -buffer-name=search -mode=normal grep<CR>

nmap <silent> <C-u><C-t> :<C-u>Denite filetype<CR>
nmap <silent> <C-u><C-c> :<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-u><C-g> :<C-u>Denite grep<CR>
nmap <silent> <C-u><C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <C-u><C-r> :<C-u>Denite -resume<CR>
nmap <silent> <C-u><C-d> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" nmap <silent> <C-u><C-p> :<C-u>Denite file_rec<CR>
" nmap <silent> <C-u><C-j> :<C-u>Denite line<CR>
" nmap <silent> <C-u><C-u> :<C-u>Denite file_mru<CR>
nmap <silent> <C-u>; :<C-u>Denite -resume -immediately -select=+1<CR>
nmap <silent> <C-u>- :<C-u>Denite -resume -immediately -select=-1<CR>
" nnoremap ml :<C-u>call denite#start([{'name': 'file_rec', 'args': [g:memolist_path]}])<CR>

" syntax check
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 2
let g:ale_sign_column_always = 1

" php
let php_sql_query = 1

"" 日本語エンコード関連
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif

if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
		" iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
function! AU_ReCheck_FENC()
	if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
		let &fileencoding=&encoding
	endif
endfunction
autocmd BufReadPost * call AU_ReCheck_FENC()

