:vmap <C-C> <ESC>'<d'>O=begin<ESC>p'>O=end<ESC>'<
:nmap <C-C> '<d'>O=begin<ESC>p'>O=end<ESC>'<
:nmap <C-S-C> mp?=begin<CR>dd/=end<CR>dd'p
:nmap <C-E> di"<ESC>hPwd2lbi:<ESC>
vnoremap <C-N> :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul
vnoremap <C-M> :s/_\([a-z]\)/\u\1/g<CR>gUl
