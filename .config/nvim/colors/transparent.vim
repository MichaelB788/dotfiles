" transparent.vim - A custom colorscheme with transparent background

" Clear any existing highlights
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Set colorscheme name
let g:colors_name = "transparent"

" Define color palette
let s:none = "NONE"
let s:black = "#000000"
let s:dark_gray = "#2d2d2d"
let s:gray = "#808080"
let s:light_gray = "#d0d0d0"
let s:white = "#ffffff"
let s:red = "#ff6b6b"
let s:green = "#51cf66"
let s:yellow = "#ffd43b"
let s:blue = "#74c0fc"
let s:magenta = "#f783ac"
let s:cyan = "#66d9ef"
let s:orange = "#ff922b"
let s:purple = "#b197fc"

" Helper function to set highlights
function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  let cmd = "highlight " . a:group
  if a:guifg != ""
    let cmd .= " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd .= " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    let cmd .= " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    let cmd .= " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    let cmd .= " gui=" . a:attr . " cterm=" . a:attr
  endif
  execute cmd
endfunction

" Basic UI elements
call s:hi('Normal', s:light_gray, s:none, 'lightgray', 'none', '')
call s:hi('NonText', s:gray, s:none, 'gray', 'none', '')
call s:hi('EndOfBuffer', s:gray, s:none, 'gray', 'none', '')
call s:hi('LineNr', s:gray, s:none, 'gray', 'none', '')
call s:hi('CursorLineNr', s:yellow, s:none, 'yellow', 'none', 'bold')
call s:hi('CursorLine', '', s:none, '', 'none', 'none')
call s:hi('CursorColumn', '', s:dark_gray, '', 'darkgray', '')
call s:hi('ColorColumn', '', s:dark_gray, '', 'darkgray', '')
call s:hi('SignColumn', '', s:none, '', 'none', '')
call s:hi('VertSplit', s:gray, s:none, 'gray', 'none', '')
call s:hi('StatusLine', s:white, s:dark_gray, 'white', 'darkgray', 'bold')
call s:hi('StatusLineNC', s:gray, s:dark_gray, 'gray', 'darkgray', '')
call s:hi('TabLine', s:gray, s:dark_gray, 'gray', 'darkgray', '')
call s:hi('TabLineFill', s:gray, s:dark_gray, 'gray', 'darkgray', '')
call s:hi('TabLineSel', s:white, s:none, 'white', 'none', 'bold')

" Search and selection
call s:hi('Search', s:black, s:yellow, 'black', 'yellow', '')
call s:hi('IncSearch', s:black, s:orange, 'black', 'red', '')
call s:hi('Visual', s:white, s:blue, 'white', 'blue', '')
call s:hi('VisualNOS', s:white, s:blue, 'white', 'blue', '')

" Popup menus
call s:hi('Pmenu', s:light_gray, s:dark_gray, 'lightgray', 'darkgray', '')
call s:hi('PmenuSel', s:white, s:blue, 'white', 'blue', 'bold')
call s:hi('PmenuSbar', '', s:gray, '', 'gray', '')
call s:hi('PmenuThumb', '', s:white, '', 'white', '')

" Fold
call s:hi('Folded', s:gray, s:none, 'gray', 'none', 'italic')
call s:hi('FoldColumn', s:gray, s:none, 'gray', 'none', '')

" Diff
call s:hi('DiffAdd', s:green, s:none, 'green', 'none', '')
call s:hi('DiffChange', s:yellow, s:none, 'yellow', 'none', '')
call s:hi('DiffDelete', s:red, s:none, 'red', 'none', '')
call s:hi('DiffText', s:white, s:blue, 'white', 'blue', 'bold')

" Syntax highlighting
call s:hi('Comment', s:gray, '', 'gray', '', 'italic')
call s:hi('Todo', s:yellow, '', 'yellow', '', 'bold')
call s:hi('Error', s:red, s:none, 'red', 'none', 'bold')
call s:hi('ErrorMsg', s:red, s:none, 'red', 'none', 'bold')
call s:hi('WarningMsg', s:orange, s:none, 'yellow', 'none', 'bold')

" Constants
call s:hi('Constant', s:cyan, '', 'cyan', '', '')
call s:hi('String', s:green, '', 'green', '', '')
call s:hi('Character', s:green, '', 'green', '', '')
call s:hi('Number', s:magenta, '', 'magenta', '', '')
call s:hi('Boolean', s:magenta, '', 'magenta', '', '')
call s:hi('Float', s:magenta, '', 'magenta', '', '')

" Identifiers
call s:hi('Identifier', s:blue, '', 'blue', '', '')
call s:hi('Function', s:yellow, '', 'yellow', '', 'bold')

" Statements
call s:hi('Statement', s:red, '', 'red', '', 'bold')
call s:hi('Conditional', s:red, '', 'red', '', 'bold')
call s:hi('Repeat', s:red, '', 'red', '', 'bold')
call s:hi('Label', s:red, '', 'red', '', 'bold')
call s:hi('Operator', s:white, '', 'white', '', '')
call s:hi('Keyword', s:red, '', 'red', '', 'bold')
call s:hi('Exception', s:red, '', 'red', '', 'bold')

" PreProc
call s:hi('PreProc', s:orange, '', 'yellow', '', 'bold')
call s:hi('Include', s:orange, '', 'yellow', '', 'bold')
call s:hi('Define', s:orange, '', 'yellow', '', 'bold')
call s:hi('Macro', s:orange, '', 'yellow', '', 'bold')
call s:hi('PreCondit', s:orange, '', 'yellow', '', 'bold')

" Types
call s:hi('Type', s:cyan, '', 'cyan', '', 'bold')
call s:hi('StorageClass', s:cyan, '', 'cyan', '', 'bold')
call s:hi('Structure', s:cyan, '', 'cyan', '', 'bold')
call s:hi('Typedef', s:cyan, '', 'cyan', '', 'bold')

" Special
call s:hi('Special', s:magenta, '', 'magenta', '', '')
call s:hi('SpecialChar', s:magenta, '', 'magenta', '', '')
call s:hi('Tag', s:blue, '', 'blue', '', '')
call s:hi('Delimiter', s:white, '', 'white', '', '')
call s:hi('SpecialComment', s:gray, '', 'gray', '', 'bold')
call s:hi('Debug', s:red, '', 'red', '', '')

" Underlined
call s:hi('Underlined', s:blue, '', 'blue', '', 'underline')

" Ignore
call s:hi('Ignore', s:gray, '', 'gray', '', '')

" LSP/Diagnostic highlights (for Neovim 0.6+)
call s:hi('DiagnosticError', s:red, '', 'red', '', '')
call s:hi('DiagnosticWarn', s:orange, '', 'yellow', '', '')
call s:hi('DiagnosticInfo', s:blue, '', 'blue', '', '')
call s:hi('DiagnosticHint', s:cyan, '', 'cyan', '', '')
call s:hi('DiagnosticUnderlineError', '', '', '', '', 'underline')
call s:hi('DiagnosticUnderlineWarn', '', '', '', '', 'underline')
call s:hi('DiagnosticUnderlineInfo', '', '', '', '', 'underline')
call s:hi('DiagnosticUnderlineHint', '', '', '', '', 'underline')

" Treesitter highlights (common ones)
call s:hi('@comment', s:gray, '', 'gray', '', 'italic')
call s:hi('@keyword', s:red, '', 'red', '', 'bold')
call s:hi('@string', s:green, '', 'green', '', '')
call s:hi('@number', s:magenta, '', 'magenta', '', '')
call s:hi('@boolean', s:magenta, '', 'magenta', '', '')
call s:hi('@function', s:yellow, '', 'yellow', '', 'bold')
call s:hi('@method', s:yellow, '', 'yellow', '', 'bold')
call s:hi('@variable', s:blue, '', 'blue', '', '')
call s:hi('@type', s:cyan, '', 'cyan', '', 'bold')
call s:hi('@constant', s:cyan, '', 'cyan', '', '')
call s:hi('@operator', s:white, '', 'white', '', '')

" Git signs (if using gitsigns.nvim)
call s:hi('GitSignsAdd', s:green, s:none, 'green', 'none', '')
call s:hi('GitSignsChange', s:yellow, s:none, 'yellow', 'none', '')
call s:hi('GitSignsDelete', s:red, s:none, 'red', 'none', '')

" Telescope (if using telescope.nvim)
call s:hi('TelescopeSelection', s:white, s:blue, 'white', 'blue', 'bold')
call s:hi('TelescopeMatching', s:yellow, '', 'yellow', '', 'bold')

" NvimTree (if using nvim-tree.lua)
call s:hi('NvimTreeFolderIcon', s:blue, '', 'blue', '', '')
call s:hi('NvimTreeFolderName', s:blue, '', 'blue', '', '')
call s:hi('NvimTreeOpenedFolderName', s:blue, '', 'blue', '', 'bold')

" Clean up
unlet s:none s:black s:dark_gray s:gray s:light_gray s:white
unlet s:red s:green s:yellow s:blue s:magenta s:cyan s:orange s:purple
