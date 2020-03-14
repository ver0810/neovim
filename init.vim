filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
let &t_ut=''
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | end

set number
set list
set cursorline
set wildmenu
set wrap
set relativenumber
syntax on
set scrolloff=5
map S :w<CR>
map Q :q<CR>
noremap j k
noremap k j
noremap a i
noremap i a
"=========================
"=========================
"分屏
map sh :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>

map <SPACE>j <C-w>k
map <SPACE>k <C-w>j
map <SPACE>h <C-w>h
map <SPACE>l <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

map te :tabe<CR>
map pi :PlugInstall<CR>
map R :source init.vim<CR>
"=====================================e-analysis/ale'e-analysis/ale'e-analysis/ale'
"plug插件
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"主题
Plug 'https://github.com/joshdick/onedark.vim'
"自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
"错误检查
Plug 'dense-analysis/ale'
"树形文件索引
Plug 'preservim/nerdtree'
call plug#end()

colorscheme onedark
let g: airline_theme='onedarke'


"=============================================
"一键运行代码
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
O
		"exec '!time ipython3 %'
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc

"markdown-preview
"=====
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === coc
" ===


"=====
"=====nerdtree
"=====
map <C-n> :NERDTreeToggle<CR>


