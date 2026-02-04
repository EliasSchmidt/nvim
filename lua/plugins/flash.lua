return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = {"n", "x", "o" }, function () require("flash").jump() end, "Flash" },
    { "S", mode = {"n", "x", "o" }, function () require("flash").treesitter() end, "Flash treesitter" },
  }
}
