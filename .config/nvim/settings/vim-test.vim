let g:test#strategy = 'neovim'
let g:test#ruby#rails#options = '--verbose --color'
let g:test#javascript#jest#file_pattern =  '\v(.*)test\.(js|mjs|ts|jsx|tsx)$'
let g:test#javascript#jest#executable = 'yarn test --no-watch --no-coverage'
let g:test#javascript#runner = 'jest'

nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>
