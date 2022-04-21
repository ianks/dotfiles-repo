let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

let g:onedark_config = {
  \ 'style': 'darker',
\ }

if has("gui_running")
  set t_Co=256
  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16
else
  let g:CSApprox_loaded = 1
endif

set background=dark
colorscheme onedark

lua << END
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END
