
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ft = {
        "typst",
        "lua",
        "c",
        "vim",
        "rust",
        "vimdoc",
        "zig",
        "markdown",
        "nix",
    },
    config = function() require"user.plugins.config.treesitter" end
}

