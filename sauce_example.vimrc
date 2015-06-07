" Example Sauce file for Symfony2 / Php projects
" Uncomment what is needed

let g:current_dir = "~/sites/mysite.nl/public_html"

" Codesniffer argument list
" let g:phpqa_codesniffer_args = "--standard=Symfony2"

" This is a requirement
exec 'NERDTree ' . g:current_dir

" CrtlP ignore example, not idea and cache folders
" let g:ctrlp_custom_ignore = {
"           \ 'dir':  '\v[\/]\.(git|hg|svn|cache|idea)$',
"            \ 'file': '\v\.(exe|so|dll)$',
"            \ 'link': '',
"            \ }

" Ctags generated file
" exec "set tags=./php.tags"

