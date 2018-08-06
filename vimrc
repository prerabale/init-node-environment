set nocompatible               " 取消与vi编辑器的兼容显示
syntax on                      " 关键字上色

colorscheme molokai

"common conf {{ 通用配置
"
set encoding=cp936             " 一下几条都是解决中文乱码的配置
"set langmenu=zh_CN
"set imcmdline
set termencoding=utf8
set fileencodings=utf-8,gbk,ucs-bom,cp936

set ai                         " 自动缩进
"set cindent                    " C风格的智能缩进
set smartindent                " 智能缩进
set sw=2                       " 换行缩进
set ts=2                       " tab缩进
set et                         " 输入的tab转换为空格,已有的tab不会转换，如需要可手动输入命令':retab'
set nu                         " 显示行号
set cul                        " 浅色高亮显示光标所在当前行
"set  cursorline               " 为光标所在行添加下划线
set cuc                        " 设置一个标尺来显示代码对齐
set ru                         " 添加一个标尺显示光标所在行列
set showmatch                  " 高亮显示匹配的括号
set is                         " 边输入边检索
set t_Co=256
set background=light
set showcmd                    " 输入的命令显示出来，看的清楚些
set backspace=indent,eol,start " 非常好用的Backspace键设置
set whichwrap=b,s,<,>,[,]      " 位于行两端时左右键能够换行
set fileencoding=utf-8
"set fileencoding=ucs-bom,utf8,prc " 测试报错，这行配置暂时不可用----------
set hls "高亮显示找到的文本
set helplang=cn                " 帮助系统设置为中文
"set langmenu=zh_CN.UTF-8
set tw=120                     " 行长度
set lbr                        " 不在单词中间断行
set fo+=mB                     " m:允许在两个汉字中间断行(即使中间没有空格)，B:两行合并时，汉字之间不要补空格
set wildmenu                   " 在命令模式下使用Tab自动补全的时候，将补全内容使用一个单行菜单形式显示出来。
set ignorecase smartcase       " 查找时智能检索大小写
"set spell                      " 拼写检查，拼写错误的单词下方会有红色的波浪线
""}}

"{{
"}}
"""F * 键位的功能设置 {{

"Save all {{
nmap <F2> :wa<cr>
"}}

" 按下 F3 调出/隐藏 NERDTree {{
map <F3> :NERDTreeToggle<CR>
""""""" "NERDTree的相关配置"
let NERDChristmasTree=1            " 让树更好看,我是没看出来
let NERDTreeCaseSensitiveSort=1    " 让文件排列更有序
let NERDTreeChDirMode=1            " 改变tree目录的同时改变工程的目录

"自动是用node，如果文件类型是JavaScript
"启动vim，没有打开任何文件时，开始NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"关闭其它文件，在窗口只剩下NERDTree时，关闭NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowBookmarks=1

"autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
"NERDTree窗口位置的设置
"let NERDTreeWinPos="right"
"}}

"为方便复制，用<F4>开启/关闭行号显示: {{
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>
"}}

"复制代码时手动关闭缩进，保持代码的原有格式,复制完成后需要手动开启缩进{{
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste
"}}

nmap <F8> :TagbarToggle<CR>

"状态栏主题
"powerline: {{
set nocompatible
set laststatus=2
set encoding=utf-8
let t_Co=256
"choose theme
let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols = 'fancy'
" }}


"""""""""" Vundle配置{{
set nocompatible                             " 自动删除不需要的插件
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'                      " 配色方案
Plugin 'Valloric/YouCompleteMe'              " YCM安装完成之后还需要进行编译，一切的基础
Plugin 'marijnh/tern_for_vim'                " 配合YCM实现JavaScript补全，这是重点
Plugin 'jelera/vim-javascript-syntax'        " 增加JavaScript的高亮显示
Plugin 'pangloss/vim-javascript'             " 语法高亮显示
Plugin 'scrooloose/syntastic'                " 语法检查插件
Plugin 'Raimondi/delimitMate'                " 配对符号自动补全：(),''
Plugin 'Lokaltog/vim-powerline'              " 状态栏信息
Plugin 'scrooloose/nerdtree'                 " 目录树
Plugin 'Xuyuanp/nerdtree-git-plugin'         " A plugin of NERDTree showing git status flags
Plugin 'majutsushi/tagbar'                   " 函数跳转 树~
"Plugin 'junegunn/vim-easy-align'             " ,a=、,a:对齐
"Plugin 'myhere/vim-nodejs-complete'         " 或许在只需要node提示的情况下可以替代tern_for_vim，尚未测试
                                "let g:nodejs_complete_config = {
                                "\  'js_compl_fn': 'jscomplete#CompleteJS', "这段代码会独占omnifunc，导致tern_for_vim的提示不能在ycm中自动显示
                                "\  'max_node_compl_len': 15
                                "\}

call vundle#end()            " required
filetype indent on                           " 许多插件生效依赖这行命令
filetype plugin on                           " 允许插件
filetype plugin indent on                    " 启动自动补全

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1  " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1       " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1     " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1     " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

""scrooloose/syntastic的配置信息,输入：help syntastic查看{{
let g:syntastic_enable_signs=1               " 1：自动弹出错误信息窗口；:lclose关闭窗口;:lopen呼出窗口
let g:syntastic_check_on_open = 1            " 保存时检验代码
let g:syntastic_check_on_wq = 0              " 0: 在命令行输入：wq、：x、：ZZ时跳过检验代码
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>'
let g:syntastic_always_populate_loc_list = 1 " 发现error时将其插入错误列表
let g:syntastic_auto_jump = 2                " 跳到第一个被发现的错误的所在位置 ; 2:类型为error时才跳转;3:类型不是warning就跳转
let g:syntastic_auto_loc_list = 1            " 0: 不会自动开启或关闭错误提示窗口；1:自动开启或关闭;2:会自动关闭，不会自动开启
let g:syntastic_loc_list_height = 5          " 错误提示窗口的高度
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
""}}