" flow colorscheme
" modified from palenight and nord

" Clear any other set colors
highlight clear
set background=dark

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'flow'

" === Functions ===

function! s:SetHighlight(group, fg, bg, attr)
  let l:attr = a:attr

  if l:attr == 'italic'
    let l:attr = ''
  endif

  if empty(l:attr)
    let l:attr = 'none'
  endif

  if !empty(a:fg)
    exec 'hi ' . a:group . ' guifg=' . a:fg.gui . ' ctermfg=' . a:fg.cterm
  endif

  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg.gui . ' ctermbg=' . a:bg.cterm
  endif

  if !empty(l:attr)
    exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
  endif
endfun


let s:bg = { 'gui': '#1D2023', 'cterm': 234 }
let s:fg = { 'gui': '#D8DEE9', 'cterm': 146 }
let s:invisibles = { 'gui': '#4e5785', 'cterm': 60 }
let s:comments = { 'gui': '#81858c', 'cterm': 60 }
let s:selection = { 'gui': '#343b51', 'cterm': 60 }
let s:guides = { 'gui': '#4e5579', 'cterm': 60 }
let s:caret = { 'gui': '#ffcc00', 'cterm': 220 }
let s:line_numbers = { 'gui': '#3a3f58', 'cterm': 60 }
let s:line_highlight = { 'gui': '#1c1f2b', 'cterm': 234 }
let s:white = { 'gui': '#ECEFF4', 'cterm': 231 }
let s:black = { 'gui': '#000000', 'cterm': 232 }
let s:red = { 'gui': '#ff5370', 'cterm': 203 }
let s:orange = { 'gui': '#f78c6c', 'cterm': 209 }
let s:yellow = { 'gui': '#EBCB8B', 'cterm': 11 }
let s:green = { 'gui': '#96cf86', 'cterm': 2 }
let s:cyan = { 'gui': '#89ddff', 'cterm': 117 }
let s:blue = { 'gui': '#82aaff', 'cterm': 111 }
let s:paleblue = { 'gui': '#81A1C1', 'cterm': 152 }
let s:purple = { 'gui': '#b97be3', 'cterm': 176 }
let s:brown = { 'gui': '#c17e70', 'cterm': 137 }
let s:pink = { 'gui': '#f07178', 'cterm': 204 }
let s:violet = { 'gui': '#cf9bc5', 'cterm': 139 }
let s:neon = { 'gui': '#39FF14', 'cterm': 10 }

let g:material_colorscheme_map = {}
let g:material_colorscheme_map.bg = s:bg
let g:material_colorscheme_map.fg = s:fg
let g:material_colorscheme_map.invisibles = s:invisibles
let g:material_colorscheme_map.comments = s:comments
let g:material_colorscheme_map.caret = s:caret
let g:material_colorscheme_map.selection = s:selection
let g:material_colorscheme_map.guides = s:guides
let g:material_colorscheme_map.line_numbers = s:line_numbers
let g:material_colorscheme_map.line_highlight = s:line_highlight
let g:material_colorscheme_map.white = s:white
let g:material_colorscheme_map.black = s:black
let g:material_colorscheme_map.red = s:red
let g:material_colorscheme_map.orange = s:orange
let g:material_colorscheme_map.yellow = s:yellow
let g:material_colorscheme_map.green = s:green
let g:material_colorscheme_map.cyan = s:cyan
let g:material_colorscheme_map.blue = s:blue
let g:material_colorscheme_map.paleblue = s:paleblue
let g:material_colorscheme_map.purple = s:purple
let g:material_colorscheme_map.brown = s:brown
let g:material_colorscheme_map.pink = s:pink
let g:material_colorscheme_map.violet = s:violet

" === Highlights ===

" Vim Editor
call s:SetHighlight('ColorColumn', '', s:invisibles, '')
call s:SetHighlight('Cursor', s:bg, s:caret, '')
call s:SetHighlight('CursorColumn', '', s:line_highlight, '')
call s:SetHighlight('CursorLine', '', s:line_highlight, '')
call s:SetHighlight('CursorLineNr', s:comments, '', '')
call s:SetHighlight('Directory', s:blue, '', '')
call s:SetHighlight('DiffAdd', s:green, s:bg, '')
call s:SetHighlight('DiffDelete', s:red, s:bg, '')
call s:SetHighlight('DiffChange', s:yellow, s:bg, '')
call s:SetHighlight('DiffText', s:orange, s:bg, '')
call s:SetHighlight('ErrorMsg', s:bg, s:red, 'bold')
call s:SetHighlight('FoldColumn', s:line_numbers, s:bg, '')
call s:SetHighlight('Folded', s:brown, s:bg, 'bold')
call s:SetHighlight('LineNr', s:line_numbers, '', '')
call s:SetHighlight('MatchParen', s:comments, s:cyan, 'bold')
call s:SetHighlight('ModeMsg', s:green, '', '')
call s:SetHighlight('MoreMsg', s:green, '', '')
call s:SetHighlight('NonText', s:comments, '', '')
call s:SetHighlight('Normal', s:fg, s:bg, '')
call s:SetHighlight('Pmenu', s:fg, s:selection, '')
call s:SetHighlight('PmenuSel', s:bg, s:cyan, '')
call s:SetHighlight('PmenuSbar', '', s:selection, '')
call s:SetHighlight('PmenuThumb', '', s:comments, '')
call s:SetHighlight('Question', s:blue, '', '')
call s:SetHighlight('IncSearch', s:bg, s:yellow, 'none')
call s:SetHighlight('Search', s:bg, s:yellow, 'none')
call s:SetHighlight('SignColumn', s:fg, s:bg, '')
call s:SetHighlight('SpecialKey', s:comments, '', '')
call s:SetHighlight('SpellCap', s:blue, '', 'undercurl')
call s:SetHighlight('SpellBad', s:red, '', 'undercurl')
call s:SetHighlight('StatusLine', s:fg, s:selection, '')
call s:SetHighlight('StatusLineNC', s:comments, s:selection, '')
call s:SetHighlight('StatusLineTerm', s:bg, s:green, '')
call s:SetHighlight('StatusLineTermNC', s:bg, s:green, '')
call s:SetHighlight('TabLine', s:fg, s:line_numbers, '')
call s:SetHighlight('TabLineFill', s:fg, s:selection, '')
call s:SetHighlight('TabLineSel', s:bg, s:cyan, '')
call s:SetHighlight('Title', s:green, '', '')
call s:SetHighlight('VertSplit', s:comments, '', '')
call s:SetHighlight('Visual', s:fg, s:selection, '')
call s:SetHighlight('WarningMsg', s:red, '', '')
call s:SetHighlight('WildMenu', s:bg, s:cyan, '')

" Syntax
call s:SetHighlight('Comment', s:comments, '', 'italic')
call s:SetHighlight('Conceal', s:brown, s:bg, '')
call s:SetHighlight('Constant', s:orange, '', '')
call s:SetHighlight('String', s:green, '', '')
call s:SetHighlight('Character', s:green, '', '')
call s:SetHighlight('Identifier', s:red, '', '')
call s:SetHighlight('Function', s:blue, '', '')
call s:SetHighlight('Statement', s:purple, '', '')
call s:SetHighlight('Operator', s:cyan, '', '')
call s:SetHighlight('PreProc', s:cyan, '', '')
call s:SetHighlight('Include', s:blue, '', '')
call s:SetHighlight('Define', s:purple, '', '')
call s:SetHighlight('Macro', s:purple, '', '')
call s:SetHighlight('Type', s:yellow, '', '')
call s:SetHighlight('Structure', s:cyan, '', '')
call s:SetHighlight('Special', s:violet, '', '')
call s:SetHighlight('Underlined', s:blue, '', '')
call s:SetHighlight('Error', s:bg, s:red, '')
call s:SetHighlight('Todo', s:red, s:neon, 'bold')

" Legacy groups for official git.vim and diff.vim syntax
hi! link diffFile DiffAdd
hi! link diffNewFile DiffDelete
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffLine DiffChange
hi! link diffRemoved DiffDelete

" Git Commit Messages
call s:SetHighlight('gitcommitHeader', s:purple, '', '')
call s:SetHighlight('gitcommitUnmerged', s:green, '', '')
call s:SetHighlight('gitcommitSelectedFile', s:green, '', '')
call s:SetHighlight('gitcommitDiscardedFile', s:red, '', '')
call s:SetHighlight('gitcommitUnmergedFile', s:yellow, '', '')
call s:SetHighlight('gitcommitSelectedType', s:green, '', '')
call s:SetHighlight('gitcommitSummary', s:blue, '', '')
call s:SetHighlight('gitcommitDiscardedType', s:red, '', '')
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" Javascript
call s:SetHighlight('javaScriptBraces', s:fg, '', '')
call s:SetHighlight('javaScriptNull', s:orange, '', '')
call s:SetHighlight('javaScriptIdentifier', s:purple, '', '')
call s:SetHighlight('javaScriptNumber', s:orange, '', '')
call s:SetHighlight('javaScriptRequire', s:cyan, '', '')
call s:SetHighlight('javaScriptReserved', s:purple, '', '')

" pangloss/vim-javascript
call s:SetHighlight('jsArrowFunction', s:purple, '', '')
call s:SetHighlight('jsAsyncKeyword', s:purple, '', '')
call s:SetHighlight('jsBooleanTrue', s:orange, '', '')
call s:SetHighlight('jsBooleanFalse', s:orange, '', '')
call s:SetHighlight('jsBrackets', s:pink, '', '')
call s:SetHighlight('jsCatch', s:cyan, '', 'italic')
call s:SetHighlight('jsClassBraces', s:cyan, '', '')
call s:SetHighlight('jsClassDefinition', s:yellow, '', '')
call s:SetHighlight('jsClassFuncName', s:pink, '', '')
call s:SetHighlight('jsClassProperty', s:pink, '', '')
call s:SetHighlight('jsClassKeyword', s:purple, '', '')
call s:SetHighlight('jsConditional', s:cyan, '', 'italic')
call s:SetHighlight('jsDocParam', s:green, '', '')
call s:SetHighlight('jsDocTags', s:cyan, '', '')
call s:SetHighlight('jsDot', s:cyan, '', '')
call s:SetHighlight('jsException', s:cyan, '', 'italic')
call s:SetHighlight('jsExceptions', s:yellow, '', '')
call s:SetHighlight('jsExport', s:cyan, '', 'italic')
call s:SetHighlight('jsExportDefault', s:cyan, '', 'italic')
call s:SetHighlight('jsExtendsKeyword', s:purple, '', '')
call s:SetHighlight('jsFinally', s:cyan, '', 'italic')
call s:SetHighlight('jsFinallyBraces', s:cyan, '', '')
call s:SetHighlight('jsFlowArgumentDef', s:yellow, '', '')
call s:SetHighlight('jsForAwait', s:cyan, '', 'italic')
call s:SetHighlight('jsFrom', s:cyan, '', 'italic')
call s:SetHighlight('jsFuncBraces', s:cyan, '', '')
call s:SetHighlight('jsFuncCall', s:blue, '', '')
call s:SetHighlight('jsFuncParens', s:cyan, '', '')
call s:SetHighlight('jsFunction', s:purple, '', '')
call s:SetHighlight('jsFunctionKey', s:pink, '', '')
call s:SetHighlight('jsGlobalObjects', s:yellow, '', '')
call s:SetHighlight('jsGlobalNodeObjects', s:yellow, '', '')
call s:SetHighlight('jsIfElseBraces', s:cyan, '', '')
call s:SetHighlight('jsImport', s:cyan, '', 'italic')
call s:SetHighlight('jsModuleAs', s:cyan, '', 'italic')
call s:SetHighlight('jsModuleBraces', s:cyan, '', '')
call s:SetHighlight('jsNull', s:cyan, '', '')
call s:SetHighlight('jsNoise', s:cyan, '', '')
call s:SetHighlight('jsObjectBraces', s:cyan, '', '')
call s:SetHighlight('jsObjectColon', s:cyan, '', '')
call s:SetHighlight('jsObjectKey', s:pink, '', '')
call s:SetHighlight('jsObjectSeparator', s:cyan, '', '')
call s:SetHighlight('jsParens', s:pink, '', '')
call s:SetHighlight('jsRepeat', s:cyan, '', 'italic')
call s:SetHighlight('jsReturn', s:cyan, '', 'italic')
call s:SetHighlight('jsStorageClass', s:purple, '', '')
call s:SetHighlight('jsTemplateBraces', s:cyan, '', '')
call s:SetHighlight('jsTemplateExpression', s:fg, '', '')
call s:SetHighlight('jsTemplateString', s:green, '', '')
call s:SetHighlight('jsThis', s:cyan, '', 'italic')
call s:SetHighlight('jsTry', s:cyan, '', 'italic')
call s:SetHighlight('jsTryCatchBraces', s:cyan, '', '')
call s:SetHighlight('jsUndefined', s:cyan, '', '')

" MaxMEllon/vim-jsx-pretty
call s:SetHighlight('jsxTag', s:cyan, '', '')
call s:SetHighlight('jsxTagName', s:pink, '', '')
call s:SetHighlight('jsxComponentName', s:yellow, '', '')
call s:SetHighlight('jsxCloseTag', s:cyan, '', '')
call s:SetHighlight('jsxEscapeJs', s:fg, '', '')
call s:SetHighlight('jsxCloseString', s:cyan, '', '')
call s:SetHighlight('jsxAttrib', s:purple, '', 'italic')
call s:SetHighlight('jsxString', s:green, '', '')
call s:SetHighlight('jsxEqual', s:purple, '', '')
call s:SetHighlight('jsxDot', s:cyan, '', '')
call s:SetHighlight('jsxSpreadOperator', s:purple, '', '')
call s:SetHighlight('jsxBraces', s:cyan, '', '')
call s:SetHighlight('jsxNamespace', s:cyan, '', '')

" JSON
call s:SetHighlight('jsonBraces', s:fg, '', '')

" CSS
call s:SetHighlight('cssAttrComma', s:fg, '', '')
call s:SetHighlight('cssPseudoClassId', s:yellow, '', '')
call s:SetHighlight('cssBraces', s:fg, '', '')
call s:SetHighlight('cssClassName', s:yellow, '', '')
call s:SetHighlight('cssClassNameDot', s:yellow, '', '')
call s:SetHighlight('cssFunctionName', s:blue, '', '')
call s:SetHighlight('cssImportant', s:cyan, '', '')
call s:SetHighlight('cssIncludeKeyword', s:purple, '', '')
call s:SetHighlight('cssTagName', s:red, '', '')
call s:SetHighlight('cssMediaType', s:orange, '', '')
call s:SetHighlight('cssProp', s:fg, '', '')
call s:SetHighlight('cssSelectorOp', s:cyan, '', '')
call s:SetHighlight('cssSelectorOp2', s:cyan, '', '')

" " Sass
" call s:SetHighlight('sassAmpersand', s:red, '', '')
" call s:SetHighlight('sassClassChar', s:yellow, '', '')
" call s:SetHighlight('sassMixinName', s:blue, '', '')
" call s:SetHighlight('sassVariable', s:purple, '', '')

" " Less
" call s:SetHighlight('lessAmpersand', s:red, '', '')
" call s:SetHighlight('lessClassChar', s:yellow, '', '')
" call s:SetHighlight('lessCssAttribute', s:fg, '', '')
" call s:SetHighlight('lessFunction', s:blue, '', '')
" call s:SetHighlight('lessVariable', s:purple, '', '')

" HTML
call s:SetHighlight('htmlTagName', s:pink, '', '')
call s:SetHighlight('htmlEndTag', s:cyan, '', '')
call s:SetHighlight('htmlTag', s:cyan, '', '')
call s:SetHighlight('htmlSpecialTagName', s:yellow, '', '')
call s:SetHighlight('htmlArg', s:purple, '', 'italic')
call s:SetHighlight('htmlTitle', s:fg, '', '')
call s:SetHighlight('htmlLink', s:fg, '', '')
"" Consistency with plasticboy/vim-markdown
call s:SetHighlight('htmlBold', s:pink, '', 'bold')
call s:SetHighlight('htmlH1', s:yellow, '', '')
call s:SetHighlight('htmlH2', s:yellow, '', '')
call s:SetHighlight('htmlH3', s:yellow, '', '')
call s:SetHighlight('htmlH4', s:yellow, '', '')
call s:SetHighlight('htmlH5', s:yellow, '', '')
call s:SetHighlight('htmlH6', s:yellow, '', '')
call s:SetHighlight('htmlItalic', s:pink, '', 'italic')

" " XML
" call s:SetHighlight('xmlAttrib', s:purple, '', 'italic')
" call s:SetHighlight('xmlEndTag', s:cyan, '', '')
" call s:SetHighlight('xmlTag', s:cyan, '', '')
" call s:SetHighlight('xmlTagName', s:pink, '', '')

" " Golang
" call s:SetHighlight('goFunctionCall', s:blue, '', '')
" call s:SetHighlight('goReceiverType', s:green, '', '')
" call s:SetHighlight('goParamName', s:orange, '', '')
" call s:SetHighlight('goParamType', s:green, '', '')
" call s:SetHighlight('goTypeDecl', s:purple, '', '')
" call s:SetHighlight('goTypeName', s:yellow, '', '')
" call s:SetHighlight('goBuiltins', s:red, '', '')
" call s:SetHighlight('goType', s:purple, '', '')
" call s:SetHighlight('goSignedInts', s:purple, '', '')
" call s:SetHighlight('goUnsignedInts', s:purple, '', '')
" call s:SetHighlight('goFloats', s:purple, '', '')
" call s:SetHighlight('goComplexes', s:purple, '', '')

" " Ruby
" call s:SetHighlight('rubyInterpolation', s:cyan, '', '')
" call s:SetHighlight('rubyInterpolationDelimiter', s:violet, '', '')
" call s:SetHighlight('rubyRegexp', s:cyan, '', '')
" call s:SetHighlight('rubyRegexpDelimiter', s:violet, '', '')
" call s:SetHighlight('rubyStringDelimiter', s:green, '', '')

" Rust
call s:SetHighlight('CocRustTypeHint', s:invisibles, '', '')
call s:SetHighlight('CocRustChainingHint', s:invisibles, '', '')

" TeX
call s:SetHighlight('texBeginEndName', s:blue, '', '')
call s:SetHighlight('texMathMatcher', s:blue, '', '')
call s:SetHighlight('texCite', s:green, '', '')
call s:SetHighlight('texRefZone', s:green, '', '')
call s:SetHighlight('texInputFile', s:green, '', '')
call s:SetHighlight('texMath', s:orange, '', '')
call s:SetHighlight('texMathOper', s:yellow, '', '')

" Markdown
call s:SetHighlight('markdownBold', s:pink, '', 'bold')
call s:SetHighlight('markdownBoldDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownCode', s:paleblue, '', '')
call s:SetHighlight('markdownCodeDelimiter', s:green, '', '')
call s:SetHighlight('markdownHeadingDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownH1', s:yellow, '', '')
call s:SetHighlight('markdownH2', s:yellow, '', '')
call s:SetHighlight('markdownH3', s:yellow, '', '')
call s:SetHighlight('markdownH4', s:yellow, '', '')
call s:SetHighlight('markdownH5', s:yellow, '', '')
call s:SetHighlight('markdownH6', s:yellow, '', '')
call s:SetHighlight('markdownItalic', s:pink, '', 'italic')
call s:SetHighlight('markdownItalicDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownLinkDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownLinkText', s:green, '', '')
call s:SetHighlight('markdownLinkTextDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownListMarker', s:cyan, '', '')
call s:SetHighlight('markdownUrl', s:pink, '', 'underline')
call s:SetHighlight('markdownUrlTitleDelimiter', s:green, '', '')

" plasticboy/vim-markdown
call s:SetHighlight('mkdBold', s:cyan, '', '')
call s:SetHighlight('mkdCodeStart', s:green, '', '')
call s:SetHighlight('mkdCodeDelimiter', s:cyan, '', '')
call s:SetHighlight('mkdDelimiter', s:cyan, '', '')
call s:SetHighlight('mkdHeading', s:cyan, '', '')
call s:SetHighlight('mkdItalic', s:cyan, '', '')
call s:SetHighlight('mkdLink', s:green, '', '')
call s:SetHighlight('mkdListItem', s:cyan, '', '')
call s:SetHighlight('mkdURL', s:pink, '', 'underline')

" vim-gitgutter and statusline git diff
call s:SetHighlight('DiffAdd', s:green, '', '')
call s:SetHighlight('DiffChange', s:yellow, '', '')
call s:SetHighlight('DiffChangeDelete', s:orange, '', '')
call s:SetHighlight('DiffDelete', s:red, '', '')

" " vim-signify
" hi link SignifySignAdd GitGutterAdd
" hi link SignifySignChange GitGutterChange
" hi link SignifySignDelete GitGutterDelete

" vim-better-whitespace
call s:SetHighlight('ExtraWhitespace', '', s:red, '')

" " NERDTree
" if has('nvim')
"   call s:SetHighlight('NERDTreeFile', s:fg, '', '')
" endif

" coc.nvim
call s:SetHighlight('CocMarkdownLink', s:purple, '', '')
call s:SetHighlight('CocErrorSign', s:red, '', '')
call s:SetHighlight('CocWarningSign', s:orange, '', '')
call s:SetHighlight('CocHintSign', s:yellow, '', '')
call s:SetHighlight('CocInfoSign', s:green, '', '')

" Neovim terminal colors
let g:terminal_color_background = s:bg.gui
let g:terminal_color_foreground = s:fg.gui
let g:terminal_color_0 = s:comments.gui
let g:terminal_color_1 = s:red.gui
let g:terminal_color_2 = s:green.gui
let g:terminal_color_3 = s:yellow.gui
let g:terminal_color_4 = s:blue.gui
let g:terminal_color_5 = s:purple.gui
let g:terminal_color_6 = s:cyan.gui
let g:terminal_color_7 = s:white.gui
let g:terminal_color_8 = g:terminal_color_0
let g:terminal_color_9 = g:terminal_color_1
let g:terminal_color_10 = g:terminal_color_2
let g:terminal_color_11 = g:terminal_color_3
let g:terminal_color_12 = g:terminal_color_4
let g:terminal_color_13 = g:terminal_color_5
let g:terminal_color_14 = g:terminal_color_6
let g:terminal_color_15 = g:terminal_color_7
