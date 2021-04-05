" vi:syntax=vim

" rattlion colorscheme
" tweaked default base-16 template by Chris Kempson (http://chriskempson.com)

" GUI color definitions
let s:gui00        = "#080808;"
let s:gui01        = "#282828"
let s:gui02        = "#383838"
let s:gui03        = "#585858"
let s:gui04        = "#b8b8b8"
let s:gui05        = "#d8d8d8"
let s:gui06        = "#e8e8e8"
let s:gui07        = "#f8f8f8"
let s:gui08        = "#da4e59"
let s:gui09        = "#fdc45a"
let s:gui0A        = "#efaa29"
let s:gui0B        = "#6fc432"
let s:gui0C        = "#2db4c5"
let s:gui0D        = "#61afef"
let s:gui0E        = "#c678dd"
let s:gui0F        = "#bb3fe0"

" Theme setup
hi clear
syntax reset
let g:colors_name = "rattlion"

" Highlighting function
" Optional variables are attributes and guisp
fun <sid>hi(group, guifg, guibg, ...)
	let l:attr = get(a:, 1, "")
	let l:guisp = get(a:, 2, "")

	if a:guifg != ""
		exec "hi " . a:group . " guifg=" . a:guifg
	endif
	if a:guibg != ""
		exec "hi " . a:group . " guibg=" . a:guibg
	endif
	if l:attr != ""
		exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
	endif
	if l:guisp != ""
		exec "hi " . a:group . " guisp=#" . l:guisp
	endif
endfun

" Vim editor colors
call <sid>hi("Normal",        s:gui05, s:gui00)
call <sid>hi("Bold",          "", "")
call <sid>hi("Debug",         s:gui08, "")
call <sid>hi("Directory",     s:gui0D, "")
call <sid>hi("Error",         s:gui00, s:gui08)
call <sid>hi("ErrorMsg",      s:gui08, s:gui00)
call <sid>hi("Exception",     s:gui08, "")
call <sid>hi("FoldColumn",    s:gui0C, s:gui01)
call <sid>hi("Folded",        s:gui03, s:gui01)
call <sid>hi("IncSearch",     s:gui01, s:gui09)
call <sid>hi("Italic",        "", "")
call <sid>hi("Macro",         s:gui08, "")
call <sid>hi("MatchParen",    "", s:gui03)
call <sid>hi("ModeMsg",       s:gui0B, "")
call <sid>hi("MoreMsg",       s:gui0B, "")
call <sid>hi("Question",      s:gui0D, "")
call <sid>hi("Search",        s:gui01, s:gui0A)
call <sid>hi("Substitute",    s:gui01, s:gui0A)
call <sid>hi("TooLong",       s:gui08, "")
call <sid>hi("Underlined",    s:gui08, "")
call <sid>hi("Visual",        "", s:gui02)
call <sid>hi("VisualNOS",     s:gui08, "")
call <sid>hi("WarningMsg",    s:gui08, "")
call <sid>hi("WildMenu",      s:gui08, s:gui0A)
call <sid>hi("Title",         s:gui0D, "")
call <sid>hi("Conceal",       s:gui0D, s:gui00)
call <sid>hi("Cursor",        s:gui00, s:gui05)
call <sid>hi("NonText",       s:gui03, "")
call <sid>hi("LineNr",        s:gui03, s:gui00)
call <sid>hi("SignColumn",    s:gui03, s:gui00)
call <sid>hi("StatusLine",    s:gui04, s:gui02)
call <sid>hi("StatusLineNC",  s:gui03, s:gui01)
call <sid>hi("VertSplit",     s:gui02, s:gui02)
call <sid>hi("ColorColumn",   "", s:gui01)
call <sid>hi("CursorColumn",  "", s:gui01)
call <sid>hi("CursorLine",    "", s:gui01)
call <sid>hi("CursorLineNr",  s:gui04, s:gui01)
call <sid>hi("QuickFixLine",  "", s:gui01)
call <sid>hi("PMenu",         s:gui05, s:gui01)
call <sid>hi("PMenuSel",      s:gui01, s:gui05)
call <sid>hi("TabLine",       s:gui03, s:gui01)
call <sid>hi("TabLineFill",   s:gui03, s:gui01)
call <sid>hi("TabLineSel",    s:gui0B, s:gui01)

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "")
call <sid>hi("Character",    s:gui08, "")
call <sid>hi("Comment",      s:gui03, "")
call <sid>hi("Conditional",  s:gui0E, "")
call <sid>hi("Constant",     s:gui09, "")
call <sid>hi("Define",       s:gui0E, "")
call <sid>hi("Delimiter",    s:gui0F, "")
call <sid>hi("Float",        s:gui09, "")
call <sid>hi("Function",     s:gui0D, "")
call <sid>hi("Identifier",   s:gui08, "")
call <sid>hi("Include",      s:gui0D, "")
call <sid>hi("Keyword",      s:gui0E, "")
call <sid>hi("Label",        s:gui0A, "")
call <sid>hi("Number",       s:gui09, "")
call <sid>hi("Operator",     s:gui05, "")
call <sid>hi("PreProc",      s:gui0A, "")
call <sid>hi("Repeat",       s:gui0A, "")
call <sid>hi("Special",      s:gui0C, "")
call <sid>hi("SpecialChar",  s:gui0F, "")
call <sid>hi("Statement",    s:gui08, "")
call <sid>hi("StorageClass", s:gui0A, "")
call <sid>hi("String",       s:gui0B, "")
call <sid>hi("Structure",    s:gui0E, "")
call <sid>hi("Tag",          s:gui0A, "")
call <sid>hi("Todo",         s:gui0A, s:gui01)
call <sid>hi("Type",         s:gui0A, "")
call <sid>hi("Typedef",      s:gui0A, "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "")
call <sid>hi("cPreCondit",  s:gui0E, "")

" C# highlighting
call <sid>hi("csClass",                 s:gui0A, "")
call <sid>hi("csAttribute",             s:gui0A, "")
call <sid>hi("csModifier",              s:gui0E, "")
call <sid>hi("csType",                  s:gui08, "")
call <sid>hi("csUnspecifiedStatement",  s:gui0D, "")
call <sid>hi("csContextualStatement",   s:gui0E, "")
call <sid>hi("csNewDecleration",        s:gui08, "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "")
call <sid>hi("cssClassName",   s:gui0E, "")
call <sid>hi("cssColor",       s:gui0C, "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0B, s:gui01)
call <sid>hi("DiffChange",   s:gui03, s:gui01)
call <sid>hi("DiffDelete",   s:gui08, s:gui01)
call <sid>hi("DiffText",     s:gui0D, s:gui01)
call <sid>hi("DiffAdded",    s:gui0B, s:gui00)
call <sid>hi("DiffFile",     s:gui08, s:gui00)
call <sid>hi("DiffNewFile",  s:gui0B, s:gui00)
call <sid>hi("DiffLine",     s:gui0D, s:gui00)
call <sid>hi("DiffRemoved",  s:gui08, s:gui00)

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:gui08, "")
call <sid>hi("gitcommitSummary",        s:gui0B, "")
call <sid>hi("gitcommitComment",        s:gui03, "")
call <sid>hi("gitcommitUntracked",      s:gui03, "")
call <sid>hi("gitcommitDiscarded",      s:gui03, "")
call <sid>hi("gitcommitSelected",       s:gui03, "")
call <sid>hi("gitcommitHeader",         s:gui0E, "")
call <sid>hi("gitcommitSelectedType",   s:gui0D, "")
call <sid>hi("gitcommitUnmergedType",   s:gui0D, "")
call <sid>hi("gitcommitDiscardedType",  s:gui0D, "")
call <sid>hi("gitcommitBranch",         s:gui09, "")
call <sid>hi("gitcommitUntrackedFile",  s:gui0A, "")
call <sid>hi("gitcommitUnmergedFile",   s:gui08, "")
call <sid>hi("gitcommitDiscardedFile",  s:gui08, "")
call <sid>hi("gitcommitSelectedFile",   s:gui0B, "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui0B, s:gui01)
call <sid>hi("GitGutterChange",  s:gui0D, s:gui01)
call <sid>hi("GitGutterDelete",  s:gui08, s:gui01)
call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui01)

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "")
call <sid>hi("htmlItalic",  s:gui0E, "")
call <sid>hi("htmlEndTag",  s:gui05, "")
call <sid>hi("htmlTag",     s:gui05, "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "")
call <sid>hi("javaScriptBraces",  s:gui05, "")
call <sid>hi("javaScriptNumber",  s:gui09, "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:gui0D, "")
call <sid>hi("jsStatement",         s:gui0E, "")
call <sid>hi("jsReturn",            s:gui0E, "")
call <sid>hi("jsThis",              s:gui08, "")
call <sid>hi("jsClassDefinition",   s:gui0A, "")
call <sid>hi("jsFunction",          s:gui0E, "")
call <sid>hi("jsFuncName",          s:gui0D, "")
call <sid>hi("jsFuncCall",          s:gui0D, "")
call <sid>hi("jsClassFuncName",     s:gui0D, "")
call <sid>hi("jsClassMethodType",   s:gui0E, "")
call <sid>hi("jsRegexpString",      s:gui0C, "")
call <sid>hi("jsGlobalObjects",     s:gui0A, "")
call <sid>hi("jsGlobalNodeObjects", s:gui0A, "")
call <sid>hi("jsExceptions",        s:gui0A, "")
call <sid>hi("jsBuiltins",          s:gui0A, "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:gui0A, "")
call <sid>hi("mailQuoted2",  s:gui0B, "")
call <sid>hi("mailQuoted3",  s:gui0E, "")
call <sid>hi("mailQuoted4",  s:gui0C, "")
call <sid>hi("mailQuoted5",  s:gui0D, "")
call <sid>hi("mailQuoted6",  s:gui0A, "")
call <sid>hi("mailURL",      s:gui0D, "")
call <sid>hi("mailEmail",    s:gui0D, "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "")
call <sid>hi("markdownError",             s:gui05, s:gui00)
call <sid>hi("markdownCodeBlock",         s:gui0B, "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui0D, "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "")
call <sid>hi("phpComparison",      s:gui05, "")
call <sid>hi("phpParent",          s:gui05, "")
call <sid>hi("phpMethodsVar",      s:gui0C, "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "")
call <sid>hi("pythonRepeat",    s:gui0E, "")
call <sid>hi("pythonInclude",   s:gui0E, "")
call <sid>hi("pythonStatement", s:gui0E, "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "")
call <sid>hi("rubyConstant",                s:gui0A, "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "")
call <sid>hi("rubyRegexp",                  s:gui0C, "")
call <sid>hi("rubySymbol",                  s:gui0B, "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "")
call <sid>hi("sassClassChar",  s:gui09, "")
call <sid>hi("sassInclude",    s:gui0E, "")
call <sid>hi("sassMixing",     s:gui0E, "")
call <sid>hi("sassMixinName",  s:gui0D, "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:gui00)
call <sid>hi("SignifySignChange",  s:gui0D, s:gui00)
call <sid>hi("SignifySignDelete",  s:gui08, s:gui00)

" Spelling highlighting
call <sid>hi("SpellBad",     "", "", "undercurl", s:gui08)
call <sid>hi("SpellLocal",   "", "", "undercurl", s:gui0C)
call <sid>hi("SpellCap",     "", "", "undercurl", s:gui0D)
call <sid>hi("SpellRare",    "", "", "undercurl", s:gui0E)

" Startify highlighting
call <sid>hi("StartifyBracket",  s:gui03, "")
call <sid>hi("StartifyFile",     s:gui07, "")
call <sid>hi("StartifyFooter",   s:gui03, "")
call <sid>hi("StartifyHeader",   s:gui0B, "")
call <sid>hi("StartifyNumber",   s:gui09, "")
call <sid>hi("StartifyPath",     s:gui03, "")
call <sid>hi("StartifySection",  s:gui0E, "")
call <sid>hi("StartifySelect",   s:gui0C, "")
call <sid>hi("StartifySlash",    s:gui03, "")
call <sid>hi("StartifySpecial",  s:gui03, "")

" Java highlighting
call <sid>hi("javaOperator",     s:gui0D, "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
