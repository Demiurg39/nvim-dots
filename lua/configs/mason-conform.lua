local ignore_install = {
    "clang-format",
}

local ensure_installed = {
    "black",
    "shfmt",
}

require("mason-conform").setup {
    ignore_install = ignore_install,
    ensure_installed = ensure_installed,
}
