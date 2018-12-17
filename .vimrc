set nocompatible " 有些插件只支持vim，需要不支持vi

" 设置包含Vundle的运行路径并进行初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 启用Vundle
"
" let Vundle管理插件
Plugin 'gmarik/Vundle.vim'

" 添加插件
" 管理缩进的插件
Plugin 'tmhedberg/SimpylFold'

" 超级搜索插件
Plugin 'kien/ctrlp.vim'

" 文件浏览
Plugin 'Scrooloose/nerdtree'

" 配色方案
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
" python
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
" Plugin 'python-mode/python-mode', { 'branch': 'develop'}

Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'junegunn/vim-emoji'
Plugin 'kabbamine/vcoolor.vim'
Plugin 'axiaoxin/favorite-vim-colorscheme'

" git
Plugin 'airblade/vim-gitgutter'

" 插件调用结束
call vundle#end()

filetype plugin indent on

" 使用不同的配色方案
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"设置编码方式
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936

" 高亮显示匹配的括号
set showmatch

" 搜索时高亮显示被找到的文本
set hlsearch

" 随着输入即时搜索
set incsearch

" 搜索时忽略大小写
set ignorecase

" 有一个以上的大写字母时仍大小写敏感
set smartcase

" 解决自动换行格式下，如高度在折行之后超过窗口高度这一行看不到的问题
set display=lastline

" 选中状态下Ctrl+c复制
vnoremap <c-c> "+y

filetype on

" 取消备份
set nobackup
set noswapfile
set noundofile

" 解决consle输出乱码
language messages zh_CN.utf-8

" 状态栏配置
set laststatus=2

" 开启语法高亮
syntax enable

" 开启语法检测
syntax on

" vimrc文件文件修改之后自动加载
autocmd! bufwritepost .vimrc source %

" 在状态栏显示正在输入的命令
set showcmd

" :next, :make 命令之前自动保存
set autowrite

" 允许使用鼠标
set mouse=a

" 设置行号
set nu

" 退格键可用
set backspace=2

" 退格键一次删掉4个空格
set smarttab

" 缩进
set autoindent
set smartindent

" 保存文件时自动删除行尾空格或Tab
autocmd BufWritePre * :%s/\s\+$//e

" 保存文件时自动删除末尾空行
autocmd BufWritePre * :%s/^$\n\+\%$//ge

" 填充Tab
set expandtab  " 用空格代替tab键
set tabstop=4 " 设定tab的长度为4
set shiftwidth=4
set shiftround

" 突出显示当前行，列
set cursorline
set cursorcolumn

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
" set t_ti= t_te=

:inoremap jk <esc>

" 打开文件时始终跳转到上次光标所在位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 映射切换tab的键位
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" normal模式下Ctrl+c全选并复制到系统剪贴板(linux必须装有vim-gnome)
nmap <C-c> gg"+yG

" visual模式下Ctrl+c复制选中内容到剪贴板
vmap <C-c> "+y

" Ctrl+v原样粘贴剪切板内容
inoremap <C-v> <ESC>"+pa

" w!!写入只读文件
cmap w!! w !sudo tee >/dev/null %:p

" F2切换行号显示
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" F3打开目录树
nmap <silent> <F3> :NERDTreeToggle<CR>

" <F6> 新建标签页
map <F6> <Esc>:tabnew<CR>

" <F7> 拷贝粘贴代码不破坏缩进
set pastetoggle=<F7>

if has("win64") || has("win32")
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8<CR><CR>
else
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p;isort %:p;<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8;isort %:p;<CR><CR>
endif

"Ctrl-X Ctrl-U emoji补全
set completefunc=emoji#complete

" instant-markdown
let g:instant_markdown_slow = 1

" airline
let g:airline_section_y = '%{strftime("%H:%M")}'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

" jedi
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-n>"
let g:jedi#popup_on_dot = 0

" flake8
let g:flake8_show_in_file = 1

let g:flake8_show_in_gutter = 1
autocmd! BufRead,BufWritePost *.py call Flake8()


" 可以看到折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1

" 指定进行分割布局的区域
set splitbelow
set splitright

"split navigations
"设置分割的快捷组合键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 在Normal Mode和Visual/Select Mode下，利用Tab键和Shift-Tab键来缩进文本
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

"启用折叠enable folding
"根据每行的缩进开启折叠
set foldmethod=indent
set foldlevel=99

"空格键来启动折叠folding
nnoremap <space> za

"Python代码缩进，支持PEP8风格的缩进
au BufNewFile,BufRead *.py
			\ set tabstop=4
			\ set softtabstop=4
			\ set shiftwidth=4
			\ set textwidth=79
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix

"js html css 文件的缩进风格
au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2
			\ set softtabstop=2
			\ set shiftwidth=2

"将多余的空白字符标示出来，用红色表示出来
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vCoolor.vim
let g:vcoolor_map = '<leader>cp'
let g:vcool_ins_rgb_map = '<leader>cpr'       " Insert rgb color.
let g:vcool_ins_hsl_map = '<leader>cph'       " Insert hsl color.
let g:vcool_ins_rgba_map = '<leader>cpra'      " Insert rgba color.
