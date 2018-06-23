" vim: set foldmethod=indent:
"
" This works in NeoVim - probably works in vim too, but i havent tested it and
" honestly, i dont really give a fuck if it works or not for other people.
" if you havent set this as your vimrc or for some reason you blew away the
" fold keybinding, press 'za' to expand/fold these sections
"
" ---- VIM
    execute pathogen#infect()
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
    " navigation
    map <M-l> :tabnext<CR>
    map <M-h> :tabprev<CR>
    map <M-Right> :tabnext<CR>
    map <M-Left> :tabprev<CR>

" ---- SPLIT WINDOWS
    set splitbelow
    set splitright

    " navigate windows
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    nnoremap <C-Left> <C-w>h
    nnoremap <C-Down> <C-w>j
    nnoremap <C-Up> <C-w>k
    nnoremap <C-Right> <C-w>l

    " resize current window
    noremap <M-S-H> <C-w><
    noremap <M-S-L> <C-w>>
    noremap <M-S-J> <C-w>-
    noremap <M-S-K> <c-w>+
    noremap <M-S-Left> <C-w><
    noremap <M-S-Right> <C-w>>
    noremap <M-S-Down> <C-w>-
    noremap <M-S-Up> <c-w>+

" ---- TERMINAL
    " spawn terminal in new window
    noremap <M-t> :split term://zsh<CR>
    noremap <M-S-T> :vsplit term://zsh<CR>

    " leave terminal by pressing esc
    tnoremap <Esc> <C-\><C-n>

" ---- LANGUAGE SPECIFIC
    " python shit
    autocmd FileType python set cc=79
    autocmd FileType python set commentstring=#\ %s
    autocmd BufWritePre *.py :%s/\s\+$//e

" ---- YOUCOMPLETEME
    " YouCompleteMe
    let g:ycm_seed_identifiers_with_syntax = 1
