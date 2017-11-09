"dein settings {{{
if &compatible
	set nocompatible
endif

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let g:loaded_matchparen = 1

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#add('Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/neomru.vim')
	call dein#add('Shougo/neoyank.vim')

	call dein#add('carlitux/deoplete-ternjs', {'depends': ['deoplete.nvim'], 'build': { 'mac': 'npm install -g tern', 'unix': 'npm install -g tern' }})
	call dein#add('kana/vim-textobj-user')
	call dein#add('kana/vim-operator-user')

	call dein#add('rhysd/vim-textobj-anyblock')
	call dein#add('rhysd/vim-operator-surround')
	call dein#add('rhysd/clever-f.vim')
	call dein#add('ctrlpvim/ctrlp.vim')
	call dein#add('Shougo/neco-syntax')
	call dein#add('Shougo/context_filetype.vim')
	call dein#add('tomtom/tcomment_vim')
	call dein#add('mattn/emmet-vim')
	call dein#add('terryma/vim-multiple-cursors')

	call dein#add('Yggdroot/indentLine')
	call dein#add('haya14busa/incsearch.vim')

	call dein#add('itchyny/lightline.vim')
	call dein#add('mgee/lightline-bufferline')
	call dein#add('othree/html5.vim')
	call dein#add('othree/yajs.vim')
	call dein#add('dag/vim-fish')
	call dein#add('neomake/neomake')
	call dein#add('cohama/lexima.vim')
	call dein#add('chrisbra/Colorizer')
	call dein#add('yuttie/comfortable-motion.vim')
	call dein#add('osyo-manga/vim-over')

	"" color
	call dein#add('rhysd/vim-color-spring-night')

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif
" }}}

filetype plugin indent on
syntax enable

set background=dark
set t_Co=256
colorscheme spring-night

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

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
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <BS>: close popup and delete backword char.
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" multiple cursor and deoplete
function! Multiple_cursors_before()
	let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
	let b:deoplete_disable_auto_complete = 0
endfunction

" Leader to space key 
let mapleader = "\<Space>"

set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set noundofile
set showmatch
set matchtime=1

"" insertモードrを抜ける 
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

"" insertモードでカーソル移動 
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" ihtml
au BufRead,BufNewFile *.ihtml set filetype=html

" indentLine
let g:indentLine_enable = 1
let g:indentLine_newVersion = 0 
let g:indentLine_faster = 0 
let g:indentLine_setColors=111
let g:indentLine_concealcursor="nc"
set list lcs=tab:\|\ 

" neomake 
autocmd! BufWritePost * Neomake
let g:neomake_php_enabled_makers = ['php']

" vim operator-surround 
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" lineline-bufferline 
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

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
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif

