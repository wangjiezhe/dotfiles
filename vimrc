" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.

runtime! archlinux.vim

" do not load defaults if ~/.vimrc is missing
" let skip_defaults_vim=1

" if empty(glob('~/.vim/autoload/plug.vim'))
  " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'                                           " Adaptation of one-light and one-dark colorschemes for Vim
" Plug 'gosukiwi/vim-atom-dark'                                 " A vim theme inspired by Atom's default dark theme
" Plug 'altercation/vim-colors-solarized'                       " Solarized Colorscheme for Vim
" Plug 'tomasr/molokai'                                         " Molokai color scheme for Vim
" Plug 'mhartington/oceanic-next'                               " Oceanic Next theme for neovim
" Plug 'dracula/vim', { 'as': 'dracula' }                       " A dark theme for Vim
" Plug 'danilo-augusto/vim-afterglow'                           " Vim adaptation of the Afterglow colorscheme
" Plug 'NLKNguyen/papercolor-theme'                             " Light & Dark Vim color schemes inspired by Google's Material Design
" Plug 'fmoralesc/molokayo'                                     " molokai variations

Plug 'yianwillis/vimcdoc'                                     " VIM Chinese documentaion
Plug 'vim-airline/vim-airline'                                " lean & mean status/tabline for vim that's light as air (Replace powerline, vim-airline)
Plug 'w0rp/ale'                                               " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration (Replace syntastic)
Plug 'skywind3000/asyncrun.vim'                               " Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }       " A tree explorer plugin for vim
Plug 'Xuyuanp/nerdtree-git-plugin'                            " A plugin of NERDTree showing git status
Plug 'tpope/vim-surround'                                     " quoting/parenthesizing made simple
Plug 'sheerun/vim-polyglot'                                   " A solid language pack for Vim
Plug 'scrooloose/nerdcommenter'                               " Vim plugin for intensely orgasmic commenting
Plug 'mattn/emmet-vim'                                        " emmet for vim
Plug 'jiangmiao/auto-pairs'                                   " Vim plugin, insert or delete brackets, parens, quotes in pair (Replace delimitMate)
Plug 'editorconfig/editorconfig-vim'                          " EditorConfig plugin for Vim
Plug 'mhinz/vim-signify'                                      " Show a diff using Vim its sign column (Replace vim-gitgutter)
Plug 'luochen1990/rainbow'                                    " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration
Plug 'easymotion/vim-easymotion'                              " Vim motions on speed!
Plug 'godlygeek/tabular'                                      " Vim script for text filtering and alignment
Plug 'ntpeters/vim-better-whitespace'                         " Better whitespace highlighting for Vim (Replace vim-trailing-whitespace)
Plug 'tpope/vim-repeat'                                       " enable repeating supported plugin maps with '.'
Plug 'majutsushi/tagbar'                                      " Vim plugin that displays tags in a window, ordered by scope
Plug 'mbbill/undotree'                                        " The ultimate undo history visualizer for VIM (Replace Gundo)
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }             " An asynchronous fuzzy finder (Replace CtrlP)
Plug 'skywind3000/vim-keysound'                               " Play typewriter sound in Vim when you are typing a letter
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' } " A code-completion engine for Vim
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}           " Generates config files for YouCompleteMe
Plug 'mhinz/vim-startify'                                     " The fancy start screen for Vim
Plug 'plasticboy/vim-markdown'                                " Markdown Vim Mode
Plug 'Shougo/echodoc.vim'                                     " Displays function signatures from completions in the command line
Plug 'ludovicchabant/vim-gutentags'                           " A Vim plugin that manages your tag files
" Plug 'skywind3000/gutentags_plus'                             " The right way to use gtags with gutentags
Plug 'sillybun/vim-autodoc'                                   " Add type hints automatically
Plug 'sillybun/vim-repl', {'do': './install.sh'}              " Open the interactive environment with the code you are writing
Plug 'jremmen/vim-ripgrep'                                    " Use RipGrep in Vim and display results in a quickfix list
Plug 'milkypostman/vim-togglelist'                            " Functions to toggle the [Location List] and the [Quickfix List] windows
Plug 'lervag/vimtex'                                          " A modern vim plugin for editing LaTeX files
Plug 'ryanoasis/vim-devicons'                                 " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'lilydjwg/fcitx.vim'                                     " keep and restore fcitx state when leaving/re-entering insert mode
Plug 'blockloop/vim-swigjs'                                   " Swig vim syntax highlighting
Plug 'gisphm/vim-gitignore'                                   " Gitignore plugin for Vim
Plug 'tpope/vim-fugitive'                                     " A Git wrapper so awesome, it should be illegal

call plug#end()

let mapleader = ","

" set shortmess=atI   " Do not work?
set nocompatible
set number
set ruler
set noshowmode
set showcmd
set mouse=a
set wildmenu
set wildmode=longest:full,full
" set lazyredraw
set scrolloff=5
" set nobackup
" set noswapfile
set undofile
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set undodir=~/.cache/vim/undo//
set autochdir
set errorbells
set visualbell
set history=1000
set autoread
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
set cmdheight=1
set laststatus=2

syntax enable
syntax on

set guifont=Source\ Code\ Pro\ Semi-Bold\ 14
set background=dark
let g:one_allow_italics = 1
set t_Co=256
" set termguicolors
if has('gui_running')
   colorscheme one
else
   colorscheme desert
endif

set encoding=utf-8
" set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" set termencoding=utf-8
" set fileencodings=utf-8,ucs-bom,cp936,gbk
" set fileencoding=utf-8

set backspace=2
set wrap
set textwidth=0
set cindent
set autoindent
set smartindent
set smartcase
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set showmatch
set magic
set showcmd
set nofoldenable
" set foldmethod=manual
set cryptmethod=blowfish2
set complete-=i
set nrformats-=octal
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set whichwrap+=<,>,h,l
set report=0
" set confirm
" set clipboard+=unnamed
set pastetoggle=<F12>

filetype plugin indent on

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>x :x<cr>

cabbrev w!! w ! sudo tee >/dev/null "%"

nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap q <nop>

noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
vmap <C-c> "+y

noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

" let g:lt_location_list_toggle_map = '<leader><leader>l'
" let g:lt_quickfix_list_toggle_map = '<leader><leader>q'

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

autocmd BufNewFile,BufRead *.sage,*.spyx,*.pyx setfiletype python
" autocmd FileType python set wrap
autocmd FileType vim set textwidth=0
autocmd FileType gitcommit,gitconfig,gitignore set noexpandtab



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\~$', '\.swp', '\.pyc', '__pycache__']


""" nerdcommenter
let g:NERDSpaceDelims = 1


""" Rainbow
let g:rainbow_active = 1


""" Easymoion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map <leader> <Plug>(easymotion-prefix)
" map  <leader>f <Plug>(easymotion-jd-f)
" nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f)
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>h <Plug>(easymotion-linebackward)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)


""" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1


""" tabular
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a" :Tabularize /"<CR>
vmap <leader>a" :Tabularize /"<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>


""" tagbar
autocmd VimEnter * nested :call tagbar#autoopen(1)
nmap <F4> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_right = 1


""" vim-signify
let g:signify_vcs_list = ['git', 'hg', 'svn']
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)


""" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


""" ale
let g:airline#extensions#ale#enabled = 1

" let g:ale_linters_explicit = 1

" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" let g:ale_open_list = 1
" let g:ale_list_window_size = 5
"
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" hi! clear SpellBad
" hi! clear SpellCap
" hi! clear SpellRare
" hi! SpellBad gui=undercurl guisp=red
" hi! SpellCap gui=undercurl guisp=blue
" hi! SpellRare gui=undercurl guisp=magenta


""" undotree
nnoremap <F7> :UndotreeToggle<CR>


""" LeaderF
noremap <leader>r :LeaderfMru<CR>
noremap <leader>m :LeaderfFunction!<CR>
" noremap <leader>s :LeaderfLine<CR>
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_RootMarkers = ['.root', '.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}


""" Auto Pairs
" let g:AutoPairsFlyMode = 1


""" keysound
let g:keysound_enable = 1
let g:keysound_theme = 'typewriter'
let g:keysound_py_version = 3
let g:keysound_volume = 1000


""" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_blacklist = {
            \ 'text': 1,
            \ }

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_seed_identifiers_with_syntax=1

" autocmd InsertLeave * if pumvisible() == 0|pclose|endif


""" asyncrun.vim
:let g:asyncrun_open = 6
let g:asyncrun_bell = 1
" nnoremap <F9> :call asyncrun#quickfix_toggle(6)<CR>

""" echodoc
let g:echodoc#enable_at_startup = 1

""" vim-gutentags
" let $GTAGSLABEL = 'native-pygments'
" let $GTAGSCONF = '/usr/share/gtags/gtags.conf'
" " let g:gutentags_define_advanced_commands = 1
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" let g:gutentags_ctags_extra_args = ['--fields=+niazfksS', '--extra=+qf']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
" let g:gutentags_auto_add_gtags_cscope = 0

autocmd FileType gitcommit,gitconfig,gitignore let g:gutentags_enabled=0

""" vim-repl
let g:sendtorepl_invoke_key = "<leader><leader>r"

""" vim-togglelist
let g:toggle_list_no_mappings = 1
nmap <script> <silent> <leader><leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader><leader>q :call ToggleQuickfixList()<CR>


""" vim-devicons
if has('gui_running')
    let g:webdevicons_enable = 1
else
    let g:webdevicons_enable = 0
endif

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction




map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -lm -Wall % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        exec "!chmod +x '%'"
        exec "! ./%"
    elseif &filetype == 'python'
        exec "!chmod +x %"
        exec "! ./%"
    elseif &filetype == 'markdown'
        exec "!chromium '%'"
    endif
endfunc

map <F6> :call CompileRunClang()<CR>
func! CompileRunClang()
    exec "w"
    if &filetype == 'c'
        exec "!clang -lm % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!clang++ % -o %<"
        exec "! ./%<"
    endif
endfunc

map <F8> :call Rungdb()<CR>
func! Rungdb()
    if &filetype == 'c'
        exec "w"
        exec "!gcc -lm -Wall % -g -o %<"
        exec "!gdb ./%<"
    elseif &filetype == 'cpp'
        exec "w"
        exec "!g++ % -g -o %<"
        exec "!gdb ./%<"
    endif
endfunc



" " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
  " execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
  " execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
  " let l:dir = s:opam_share_dir . "/merlin/vim"
  " execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
  " " Respect package order (merlin should be after ocp-index)
  " if count(s:opam_available_tools, tool) > 0
    " call s:opam_configuration[tool]()
  " endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line
" " ## added by OPAM user-setup for vim / ocp-indent ## 4689d324354014d1cb13ba92bb85eea5 ## you can edit, but keep this line
" if count(s:opam_available_tools,"ocp-indent") == 0
  " source "/home/wangjiezhe/.opam/system/share/ocp-indent/vim/indent/ocaml.vim"
" endif
" " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
