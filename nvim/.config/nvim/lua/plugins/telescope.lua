return {
    'nvim-telescope/telescope.nvim', 
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function() 
          require('telescope').setup{
  defaults = {
    mappings = {
      n = {
    	  ['<c-x>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ["<c-x>"] = require('telescope.actions').delete_buffer,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
      } -- i
    } -- mappings
  }, -- defaults

  pickers = {
      buffers = {
          sort_mru = true,
    },
  }
} -- telescope setup
      end
}
