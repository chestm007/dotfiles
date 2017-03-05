let @j = 'gg^GWWhdWG$d'
syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
execute pathogen#infect()
let g:airline_powerline_fonts = 1
set background=dark
colorscheme monokai
let g:airline_theme="luna"

"line numbers
set number

map <C-n> :NERDTreeToggle<CR>
map <leader> \<CR>
"Kurts gangsta whitespace remover
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"dbext
"Postgresql
let g:dbext_default_profile_psql ='type=PGSQL:user=instaclustr:passwd=instaclustr:host=localhost:dbname=instaclustr'

"enable mouse support
se mouse+=a
