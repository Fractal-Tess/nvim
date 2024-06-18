local setupOpts = {
  enable = true,
  enable_rename = true,
  enable_close = true,
  enable_close_on_clash = true,
  filetypes = {

    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "astro",
    "glimmer",
    "handlebars",
    "hbs",
  },
}

require("nvim-ts-autotag").setup(setupOpts)
