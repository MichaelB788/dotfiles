return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "basedpyright",
      },
      auto_update = true,
      run_on_start = true,
    },
  },
  {
    {
      "ribru17/bamboo.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("bamboo").load()
      end,
    },
  },
}
