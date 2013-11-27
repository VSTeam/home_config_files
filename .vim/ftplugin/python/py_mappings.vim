" Breakpoint. This really belongs in a filetype source file.
noremap <Space>p Oimport pudb; pudb.set_trace()<Esc>:w<CR>
inoremap <Tab>p <CR>import pudb; pudb.set_trace()
