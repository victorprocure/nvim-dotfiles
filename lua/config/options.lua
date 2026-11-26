vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- Editor Look ---
vim.o.number = true                                 -- Line numbers
vim.o.relativenumber = true                         -- distances from the cursor, for 5j / 12k etc.
vim.o.signcolumn = 'yes'                            -- always reserve the gutter, so text doesn't shift when errors appear
vim.o.cursorline = true                             -- highlight the current line
vim.o.scrolloff = 8                                 -- keep 8 lines visible above and below the cursor
vim.o.wrap = false                                  -- long lines will run off the screen
vim.o.colorcolumn = '100'                           -- a guide at the repos prettier path

--- Indentation ---
vim.o.expandtab = true                              -- Tab inserts spaces
vim.o.shiftwidth = 2                                -- indent by 2
vim.o.tabstop = 2                                   -- a real tab character displays as 2 wide
vim.o.softtabstop = 2                               -- backspace removes 2 spaces at once

--- Search ---
vim.o.ignorecase = true                             -- /foo matches Foo
vim.o.smartcase = true                              -- ... but /Foo only matches Foo
vim.o.inccommand = 'split'                          -- Live preview of :s/old/new/ as you type
vim.o.grepprg = 'rg --vimgrep --smart-case'         -- :grep respects .gitignore (i.e. skips node_modules)

--- Behaviour ---
vim.o.clipboard = 'unnamedplus'                     -- yank and paste use the OS keyboard
vim.o.undofile = true                               -- undo history survives closing the file in scratchpad
vim.o.confirm = true                                -- :q with unsaved changes asks instead of failing
vim.o.splitright = true                             -- new vertical splits open on the right
vim.o.splitbelow = true                             -- new horizontal splits open below
vim.o.updatetime = 250                              -- faster hover highlights and swap rights
vim.o.foldmethod = 'expr'                           -- folds come from an expression...
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'  -- ... which asks treesitter for the structure
vim.o.foldlevel = 99
