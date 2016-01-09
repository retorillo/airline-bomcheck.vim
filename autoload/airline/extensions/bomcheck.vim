" https://github.com/retorillo/airline-bomcheck.vim
" (C) 2016 Retorillo
" Distributed under the MIT license

if !exists("g:airline#extensions#bomcheck#symbol")
	let g:airline#extensions#bomcheck#symbol = "⛶ BOM"
endif
function! airline#extensions#bomcheck#check()
	return &bomb ? g:airline#extensions#bomcheck#symbol : ""
endfunction
function! airline#extensions#bomcheck#start()
	let g:airline_section_warning .= airline#section#create(['bomcheck'])
	call airline#update_statusline() 
endfunction
function! airline#extensions#bomcheck#init(...)
	call airline#parts#define_raw('bomcheck', '%{ airline#extensions#bomcheck#check() }')
	autocmd User AirlineAfterInit call airline#extensions#bomcheck#start()
endfunction

