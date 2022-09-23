vim.g.rspec_command = "Dispatch bundle exec rspec {spec}"
vim.keymap.set("n", "<space>tf", ":call RunCurrentSpecFile()<CR>", { buffer = true, desc = "[rspec] run current file" })
vim.keymap.set("n", "<space>tn", ":call RunNearestSpec()<CR>", { buffer = true, desc = "[rspec] run nearest file" })
vim.keymap.set("n", "<space>tl", ":call RunLastSpec()<CR>", { buffer = true, desc = "[rspec] run nearest file" })
