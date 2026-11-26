--- Completion ---
require('blink.cmp').setup({
  --- 'default' preset: `CTRL+y` accept, `CTRL+n/p` move, `CTRL+SPACE` open, `CTRL+e` close
  keymap = { preset = 'default' },
  completion = {
    --- show documentation beside the menu after a short pause
    documentation = { auto_show = true, auto_show_delay_ms = 300 },
  },
  --- Show a function's parameters while typing its arguments
  signature = { enabled = true },
})
