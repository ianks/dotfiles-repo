if exists('g:loaded_typescript') || &compatible
  finish
endif
let g:loaded_typescript= 1

set suffixesadd+=.ts
set suffixesadd+=.tsx
