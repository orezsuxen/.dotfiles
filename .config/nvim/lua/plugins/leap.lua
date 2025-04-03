return{
 "ggandor/leap.nvim",
  opts = {},
  config = function()
          vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap)')
          vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-anywhere)')
  end,
}
