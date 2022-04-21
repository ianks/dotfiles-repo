
command! -bar -bang -range=% -nargs=1 -complete=dir Extract
      \ execute 'Mkdir! ' expand('%:r') |
      \ execute <line1> . ',' . <line2> . 'write! ' . expand('%:r') . '/' . <f-args> |
      \ execute 'vsp ' . expand('%:r') . '/' . <f-args>
