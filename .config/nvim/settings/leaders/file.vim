"""""""""""""""""""""""""""""""""""""""
" <leader>f
" File mappings

" File search
nnoremap <leader>fs <cmd>Telescope find_files<cr>

" File explore
nnoremap <leader>fe :lua require "ianks.telescope.helpers".file_explorer()<CR>

"k Files changed
nnoremap <leader>fc :OpenChangedFiles<CR>

" File grep
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Go to file in a vertical split
nnoremap <leader>fo :vertical botright wincmd F<CR>

" Search in buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
