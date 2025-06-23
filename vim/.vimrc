" vim: set foldmethod=indent:
"
" This works in NeoVim - probably works in vim too, but i havent tested it and
" honestly, i dont really give a fuck if it works or not for other people.
" if you havent set this as your vimrc or for some reason you blew away the
" fold keybinding, press 'za' to expand/fold these sections

" ---- PLUGINS
    call plug#begin()

      " List your plugins here
      Plug 'tpope/vim-sensible'
      Plug 'tpope/vim-commentary'
      Plug 'fweep/vim-tabber'
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'

    call plug#end()
    runtime! plugin/sensible.vim  " Load sensible before our config so we can override defaults

" ---- VIM
    "execute pathogen#infect()
    set guicursor=
    set clipboard+=unnamedplus
    filetype plugin indent on
    syntax on
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    let g:airline_powerline_fonts = 1
    set background=dark
    colorscheme darcula
    let g:airline_theme="luna"
    "line numbers
    set number
    map <leader> \<CR>
    "enable mouse support
    se mouse+=a
    " dont deselect when changing indent of selection
    vnoremap < <gv
    vnoremap > >gv
    " Fix cursor
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    " sometimes i like to hold shift
    nnoremap :W :w
    nnoremap :Q :q
    " fold toggle
    nnoremap <Space> za
    " Exec .vimrc if present in a project file
    set exrc
    set secure

" ---- NERDTREE
    " Nerdtree keybinding
    map <C-n> :NERDTreeToggle<CR>

    " enable NERDTree to open when entering vim
    autocmd vimenter * NERDTree

    " set focus to the file opened, not NERDTree
    autocmd VimEnter * wincmd p

    " NERDTree config's
    let g:NERDChristmasTree=1
    let g:NERDTreeAutoCenter=1
    let g:NERDTreeAutoCenterThreshold=3

    " close vim if only nerdtree is open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---- EDITOR TABS
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'

    " This allows buffers to be hidden if you've modified a buffer.
    " This is almost a must if you wish to use buffers in this way.
    set hidden
    " To open a new empty buffer
    " This replaces :tabnew which I used to bind to this mapping
    noremap <M-Return> :enew<CR>
    " Move to the next buffer
    noremap <M-Right> :bnext<CR>
    " Move to the previous buffer
    noremap <M-Left> :bprevious<CR>
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    noremap <Leader>bq :bp <BAR> bd #<CR>
    " Show all open buffers and their status
    noremap <Leader>bl :ls<CR>

    " --- outdated, from when we were using builtin vimtabs ---
    " navigation
    " map <M-l> :tabnext<CR>
    " map <M-h> :tabprev<CR>
    " map <M-Right> :tabnext<CR>
    " map <M-Left> :tabprev<CR>

" ---- CtrlP intellisense searching
    " Set up some default ignores
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
      \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
    \}

    " Use the nearest .git directory as the cwd
    " This makes a lot of sense if you are working on a project that is in version
    " control. It also supports works with .svn, .hg, .bzr.
    let g:ctrlp_working_path_mode = 'r'

    " Use a leader instead of the actual named binding
    noremap <C-p>p :CtrlP

    " Easy bindings for its various modes
    nmap <leader>bb :CtrlPBuffer<cr>
    nmap <leader>bm :CtrlPMixed<cr>
    nmap <leader>bs :CtrlPMRU<cr>

" ---- SPLIT WINDOWS
    set splitbelow "New windows open below the current
    set splitright "New windows open to the right of the current

    " navigate windows
    noremap <C-h> :wincmd h <CR>
    noremap <C-j> :wincmd j <CR>
    noremap <C-k> :wincmd k <CR>
    noremap <C-l> :wincmd l <CR>
    noremap <C-Left> :wincmd h <CR>
    noremap <C-Down> :wincmd j <CR>
    noremap <C-Up> :wincmd k <CR>
    noremap <C-Right> :wincmd l <CR>

    " resize current window
    noremap <M-S-H> :wincmd > <CR>
    noremap <M-S-L> :wincmd < <CR>
    noremap <M-S-J> :wincmd - <CR>
    noremap <M-S-K> :wincmd + <CR>
    noremap <M-S-Left> :wincmd > <CR>
    noremap <M-S-Right> :wincmd < <CR>
    noremap <M-S-Down> :wincmd - <CR>
    noremap <M-S-Up> :wincmd + <CR>

" ---- TERMINAL
    " spawn terminal in new window
    nnoremap <M-t> :hor :term
    nnoremap <M-S-T> :vert :term

    " leave terminal by pressing esc
    tnoremap <Esc> <C-\><C-n>

" ---- LANGUAGE SPECIFIC
    " python shit 
    autocmd FileType python set cc=160
    autocmd FileType python set commentstring=#\ %s
    autocmd BufWritePre *.py :%s/\s\+$//e

    " vimrc shit
    autocmd FileType .vimrc set commentstring="\ %s

" ---- YOUCOMPLETEME
    " YouCompleteMe 
     let g:ycm_seed_identifiers_with_syntax = 1

" ---- COMMENTARY
    

