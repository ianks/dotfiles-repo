let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1

if has('autocmd') && exists('+omnifunc')
  autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif
