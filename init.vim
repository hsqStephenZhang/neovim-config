call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'

Plug 'psliwka/vim-smoothie'                                              " 平滑移动
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'                                               " 缩进线
Plug 'skywind3000/vim-terminal-help' 
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'

" language server config
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'honza/vim-snippets'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format' 
Plug 'racer-rust/vim-racer'
Plug 'fatih/vim-go'

" small theme config
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'                                              " 自动注释
Plug 'rust-lang-nursery/rustfmt'

" markddown
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'

call plug#end()

filetype plugin on

let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
set clipboard+=unnamedplus

" set ambiwidth=double

"======================================================================
"
" init-style.vim - 显示样式设置
"
"======================================================================


"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------
"
colo monokai


set t_ut= " 防止vim背景颜色错误
set showmatch " 高亮匹配括号
set matchtime=1
set report=0
set ignorecase
set nocompatible
set noeb
set softtabstop=4
set shiftwidth=4
set nobackup
set autoread
set clipboard+=unnamed

set foldmethod=indent  " 代码折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

" encoding
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" 总是显示状态栏
set laststatus=2
" 总是显示标签栏
set showtabline=2
" 设置显示制表符等隐藏字符
set list
" 右下角显示命令
set showcmd

set splitright
" 高亮当前行
set cursorline

command! -nargs=0 Pr :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


"----------------------------------------------------------------------
" 颜色主题：色彩文件位于 colors 目录中
"----------------------------------------------------------------------

" 设置黑色背景
set background=dark

" 允许 256 色
set termguicolors 

" 设置颜色主题
"colorscheme solarized
"colorscheme onedark 
" nerdtree config 
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 25
nnoremap <silent> nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<cr>
autocmd vimenter * if !argc()|NERDTree|endif
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']

au FileType python let g:NERDSpaceDelims = 0


" tab bar config
let g:tagbar_width=30
nnoremap <silent> tt :TagbarToggle<CR> " 将tagbar的开关按键设置为 F4


"======================================================================
"
" init-keymaps.vim - 键盘快捷键设置
"
"======================================================================

let mapleader="," 

"======================================================================
"
" init-language.vim - coc设置
"
"======================================================================

let g:rustfmt_autosave = 1
let g:rust_cargo_use_clippy = 1
let g:coc_global_extensions = [
            \ 'coc-diagnostic',
            \ 'coc-dictionary',
            \ 'coc-explorer',
            \ 'coc-gitignore',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-snippets',
            \ 'coc-syntax',
            \ 'coc-tag',
            \ 'coc-tasks',
            \ 'coc-vimlsp',
	    \ 'coc-sh',
            \ 'coc-yank']
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

"let g:ale_linters = {
"    \ 'python': ['pylint'],
"    \ 'vim': ['vint'],
"    \ 'cpp': ['clang'],
"    \ 'c': ['clang']
"\}

let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_conf.py'


let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'

let g:ycm_semantic_triggers =  {
			\ 'rust,c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

let g:ale_completion_enabled = 1
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
let g:ale_linters = {
\  'rust': ['analyzer'],
\}

let g:racer_insert_paren = 1
let g:racer_experimental_completer = 1

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']



" 启动python语法高亮增强
let g:python_highlight_all = 1

" golang highlight
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_types                     = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_format_strings            = 1
let g:go_highlight_variable_declarations     = 1
let g:go_highlight_variable_assignments      = 1
let g:go_highlight_diagnostic_errors         = 1
let g:go_highlight_diagnostic_warnings       = 1


nnoremap <silent> PP :CtrlP<CR>
noremap zz za  " 设置快捷键为空格
" 空格键 + 对应数字快速切换 buffer

nnoremap <silent> TT :RustTest<CR>
nnoremap <silent> TA :RustTest!<CR>
nnoremap <silent> FF :ClangFormat<CR>
xmap <Leader>F  <Plug>(coc-format-selected)
nmap <Leader>F  <Plug>(coc-format-selected)

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> ;d         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> ;s         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> ;x         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> ;t         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>;d <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>;D <Plug>(rust-doc-tab)
augroup END

"nmap <silent> ld <Plug>(ALEGoToDefinition)
"nmap <silent> ly <Plug>(ALEGoToTypeDefinition)
"nmap <silent> li <Plug>(coc-implementation)
"nmap <silent> lr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 支持json注释
autocmd FileType json syntax match Comment +\/\/.\+$+
" 标签页操作
" 打开新的标签页 tabe new
map te :tabe
map tc :tabclose
" 在标签页跳转 h/l 和 vim 控制键一样
map th :-tabnext
map tl :+tabnext

" 关闭标签页 tabe close
map tq :tabclose
" 移动标签页 tabe move h/j
map tmh :-tabmove
map tml :+tabmove


" faster movement
noremap <silent> K 5k
noremap <silent> J 5j
" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

noremap <C-K> 5<C-y>
noremap <C-J> 5<C-e>


"----------------------------------------------------------------------
" 多光标配置
"----------------------------------------------------------------------
" 在当前位置放下光标
"nmap <silent> <C-i> <Plug>(coc-cursors-position)
" 在选中位置放下光标
"xmap <silent> <C-i> <Plug>(coc-cursors-range)

" 选中相同的单词
"
"

set mouse=a
inoremap \\ <esc>
noremap <silent> <leader>p viwp

map <LEADER>P "+p
map <LEADER>Y "+y
