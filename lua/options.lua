require "nvchad.options"

-- add yours here!

local o = vim.o
-- cursorline!
o.cursorlineopt = "both"

-- 相对行号
o.number = false
o.relativenumber = true

-- 启用智能缩进
-- o.smartindent = true
-- o.tabstop = 4 -- 一个tab等于4个空格
-- o.shiftwidth = 4 -- 使用4个空格缩进
-- o.expandtab = true -- 使用空格代替Tab字符
-- o.autoindent = true -- 启用自动缩进

-- 搜索
o.incsearch = true -- 启用增量搜索
o.ignorecase = true -- 搜索时忽略大小写
o.smartcase = true -- 如果搜索中包含大写字母，则区分大小写
o.hlsearch = true -- 高亮显示搜索结果
