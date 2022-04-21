-- " VimFiler
-- " Powerful file explorer

-- let g:vimfiler_as_default_explorer = 1
-- let g:vimfiler_tree_leaf_icon = '⁞'
-- let g:vimfiler_tree_opened_icon = '▿'
-- let g:vimfiler_tree_closed_icon = '▸'
-- let g:vimfiler_file_icon = ''
-- let g:vimfiler_readonly_file_icon = '⭤'
-- let g:vimfiler_marked_file_icon = '✑'
-- let g:vimfiler_time_format = ""

-- " Allow to create and remove files
-- call vimfiler#custom#profile('default', 'context', {'safe' : 0})

-- function! s:vimfiler_settings()
--   " Mimic NERDtree split behavior
--   nnoremap <silent><buffer><expr> <C-x> vimfiler#do_switch_action('split')
--   nnoremap <silent><buffer><expr> <C-v> vimfiler#do_switch_action('vsplit')
--   nnoremap <silent><buffer><expr> <C-t> vimfiler#do_switch_action('tabopen')
--   inoremap <silent><buffer><expr> <C-x> vimfiler#do_switch_action('split')
--   inoremap <silent><buffer><expr> <C-v> vimfiler#do_switch_action('vsplit')
--   inoremap <silent><buffer><expr> <C-t> vimfiler#do_switch_action('tabopen')
-- endfunction

-- autocmd FileType vimfiler call s:vimfiler_settings()
require("telescope").setup {
  defaults = {
    -- prompt_prefix = "🔍 ",
    theme = "dropdown",
    layout_strategy = "vertical",
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
      },
      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
      },
    },
    file_ignore_patterns = {
      "node_modules",
      "sorbet",
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    frecency = {
      -- default_workspace = "work",
      workspaces = {
        ["work"] = "/Users/ianks/src/github.com/Shopify",
        ["oss"] = "/Users/ianks/src/github.com/ianks",
        ["nvim"] = "/Users/ianks/.config/nvim",
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
