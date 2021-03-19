"// Vim color file

hi clear
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="visual-studio-dark"

"//----------------------------------------

hi Cursor       ctermfg=233  ctermbg=245  cterm=NONE      guifg=#1e1e1e guibg=#dcdcdc gui=NONE
hi Visual       ctermfg=NONE ctermbg=17   cterm=NONE      guifg=NONE    guibg=#1e354b gui=NONE
hi CursorLine   ctermfg=NONE ctermbg=236  cterm=NONE      guifg=NONE    guibg=#353535 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236  cterm=NONE      guifg=NONE    guibg=#353535 gui=NONE
hi ColorColumn  ctermfg=NONE ctermbg=236  cterm=NONE      guifg=NONE    guibg=#353535 gui=NONE
hi LineNr       ctermfg=245  ctermbg=236  cterm=NONE      guifg=#8f8f8f guibg=#353535 gui=NONE
hi VertSplit    ctermfg=241  ctermbg=241  cterm=NONE      guifg=#5f5f5f guibg=#5f5f5f gui=NONE
hi MatchParen   ctermfg=74   ctermbg=NONE cterm=underline guifg=#569cd6 guibg=NONE    gui=underline
hi StatusLine   ctermfg=15   ctermbg=241  cterm=bold      guifg=#ffffff guibg=#5f5f5f gui=bold
hi StatusLineNC ctermfg=15   ctermbg=241  cterm=NONE      guifg=#ffffff guibg=#5f5f5f gui=NONE
hi Pmenu        ctermfg=NONE ctermbg=NONE cterm=NONE      guifg=NONE    guibg=NONE    gui=NONE
hi PmenuSel     ctermfg=NONE ctermbg=17   cterm=NONE      guifg=NONE    guibg=#1e354b gui=NONE
hi IncSearch    ctermfg=233  ctermbg=203  cterm=NONE      guifg=#1e1e1e guibg=#d69d85 gui=NONE
hi Search       ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE    guibg=NONE    gui=underline
hi Directory    ctermfg=150  ctermbg=NONE cterm=NONE      guifg=#b4cea8 guibg=NONE    gui=NONE
hi Folded       ctermfg=15   ctermbg=233  cterm=NONE      guifg=#ffffff guibg=#1e1e1e gui=NONE
hi FoldColumn   ctermfg=15   ctermbg=233  cterm=NONE      guifg=#ffffff guibg=#1e1e1e gui=NONE
hi TabLineFill  ctermfg=245  ctermbg=236  cterm=NONE      guifg=#cccccc guibg=#353535 gui=NONE
hi TabLine      ctermfg=245  ctermbg=238  cterm=NONE      guifg=#cccccc guibg=#4a4a4a gui=NONE
hi TabLineSel   ctermfg=15   ctermbg=242  cterm=NONE      guifg=#ffffff guibg=#808080 gui=NONE

hi Normal       ctermfg=15   ctermbg=233  cterm=NONE         guifg=#ffffff guibg=#1e1e1e gui=NONE
hi Boolean      ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi Character    ctermfg=151  ctermbg=NONE cterm=NONE         guifg=#b4cea8 guibg=NONE    gui=NONE
hi Comment      ctermfg=65   ctermbg=NONE cterm=NONE         guifg=#608b4e guibg=NONE    gui=NONE
hi Conceal      ctermfg=239  ctermbg=233  cterm=NONE         guifg=#222222 guibg=#1e1e1e gui=NONE
hi Conditional  ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi Constant     ctermfg=151  ctermbg=NONE cterm=NONE         guifg=#b4cea8 guibg=NONE    gui=NONE
hi Define       ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi DiffAdd      ctermfg=15   ctermbg=64   cterm=bold         guifg=#ffffff guibg=#44810b gui=bold
hi DiffDelete   ctermfg=88   ctermbg=NONE cterm=NONE         guifg=#890606 guibg=NONE    gui=NONE
hi DiffChange   ctermfg=15   ctermbg=23   cterm=NONE         guifg=#ffffff guibg=#3b5f94 gui=NONE
hi DiffText     ctermfg=15   ctermbg=24   cterm=bold         guifg=#ffffff guibg=#597bab gui=bold
hi ErrorMsg     ctermfg=203  ctermbg=NONE cterm=NONE         guifg=#ff3333 guibg=NONE    gui=NONE
hi WarningMsg   ctermfg=203  ctermbg=NONE cterm=NONE         guifg=#ff3333 guibg=NONE    gui=NONE
hi Float        ctermfg=151  ctermbg=NONE cterm=NONE         guifg=#b5cea8 guibg=NONE    gui=NONE
hi Function     ctermfg=15   ctermbg=NONE cterm=NONE         guifg=#ffffff guibg=NONE    gui=NONE
hi Identifier   ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi Keyword      ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi Label        ctermfg=180  ctermbg=NONE cterm=NONE         guifg=#d69d85 guibg=NONE    gui=NONE
hi NonText      ctermfg=240  ctermbg=234  cterm=NONE         guifg=#565656 guibg=#292929 gui=NONE
hi Number       ctermfg=151  ctermbg=NONE cterm=NONE         guifg=#b5cea8 guibg=NONE    gui=NONE
hi Operator     ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi PreProc      ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi Special      ctermfg=15   ctermbg=NONE cterm=NONE         guifg=#ffffff guibg=NONE    gui=NONE
hi SpecialKey   ctermfg=240  ctermbg=236  cterm=NONE         guifg=#565656 guibg=#353535 gui=NONE
hi Statement    ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi StorageClass ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi String       ctermfg=180  ctermbg=NONE cterm=NONE         guifg=#d69d85 guibg=NONE    gui=NONE
hi Tag          ctermfg=74   ctermbg=NONE cterm=NONE         guifg=#569cd6 guibg=NONE    gui=NONE
hi Title        ctermfg=15   ctermbg=NONE cterm=bold         guifg=#ffffff guibg=NONE    gui=bold
hi Todo         ctermfg=65   ctermbg=NONE cterm=inverse,bold guifg=#608b4e guibg=NONE    gui=inverse,bold
hi Type         ctermfg=79   ctermbg=NONE cterm=NONE         guifg=#4ec9b0 guibg=NONE    gui=NONE
hi Underlined   ctermfg=NONE ctermbg=NONE cterm=underline    guifg=NONE    guibg=NONE    gui=underline


"// airline colors
hi AirlineI1    ctermfg=15   ctermbg=45   cterm=NONE         guifg=#ffffff guibg=#569cd6 gui=NONE
hi AirlineV1    ctermfg=15   ctermbg=92   cterm=NONE         guifg=#ffffff guibg=#68217a gui=NONE
hi AirlineR1    ctermfg=15   ctermbg=124  cterm=NONE         guifg=#ffffff guibg=#980000 gui=NONE


"// language specific
hi rubyClass                    ctermfg=74   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE gui=NONE
hi rubyFunction                 ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter   ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE    guibg=NONE gui=NONE
hi rubySymbol                   ctermfg=151  ctermbg=NONE cterm=NONE guifg=#b4cea8 guibg=NONE gui=NONE
hi rubyConstant                 ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyStringDelimiter          ctermfg=180  ctermbg=NONE cterm=NONE guifg=#d69d85 guibg=NONE gui=NONE
hi rubyBlockParameter           ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInstanceVariable         ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInclude                  ctermfg=74   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE gui=NONE
hi rubyGlobalVariable           ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRegexp                   ctermfg=180  ctermbg=NONE cterm=NONE guifg=#d69d85 guibg=NONE gui=NONE
hi rubyRegexpDelimiter          ctermfg=180  ctermbg=NONE cterm=NONE guifg=#d69d85 guibg=NONE gui=NONE
hi rubyEscape                   ctermfg=181  ctermbg=NONE cterm=NONE guifg=#e3bbab guibg=NONE gui=NONE
hi rubyControl                  ctermfg=74   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE gui=NONE
hi rubyClassVariable            ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyOperator                 ctermfg=74   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE gui=NONE
hi rubyException                ctermfg=74   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE gui=NONE
hi rubyPseudoVariable           ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsUserClass           ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsARMethod            ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsRenderMethod        ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsMethod              ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE

hi erubyDelimiter               ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE    guibg=NONE gui=NONE
hi erubyComment                 ctermfg=65   ctermbg=NONE cterm=NONE guifg=#608b4e guibg=NONE gui=NONE
hi erubyRailsMethod             ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE

hi htmlTag                      ctermfg=244  ctermbg=NONE cterm=NONE guifg=#808080 guibg=NONE gui=NONE
hi htmlEndTag                   ctermfg=244  ctermbg=NONE cterm=NONE guifg=#808080 guibg=NONE gui=NONE
hi htmlTagName                  ctermfg=75   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE gui=NONE
hi htmlArg                      ctermfg=117  ctermbg=NONE cterm=NONE guifg=#92caf4 guibg=NONE gui=NONE
hi htmlSpecialChar              ctermfg=114  ctermbg=NONE cterm=NONE guifg=#b4cea8 guibg=NONE gui=NONE

hi javaScriptFunction           ctermfg=74   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE gui=NONE
hi javaScriptRailsFunction      ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi javaScriptBraces             ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE    guibg=NONE gui=NONE

hi yamlKey                      ctermfg=74   ctermbg=NONE cterm=NONE guifg=#569cd6 guibg=NONE    gui=NONE
hi yamlAnchor                   ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE    gui=NONE
hi yamlAlias                    ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE    gui=NONE
hi yamlDocumentHeader           ctermfg=NONE ctermbg=235  cterm=NONE guifg=NONE    guibg=#282828 gui=NONE

hi cssURL                       ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi cssFunctionName              ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi cssColor                     ctermfg=151  ctermbg=NONE cterm=NONE guifg=#b4cea8 guibg=NONE gui=NONE
hi cssPseudoClassId             ctermfg=117  ctermbg=NONE cterm=NONE guifg=#92caf4 guibg=NONE gui=NONE
hi cssClassName                 ctermfg=117  ctermbg=NONE cterm=NONE guifg=#92caf4 guibg=NONE gui=NONE
hi cssValueLength               ctermfg=151  ctermbg=NONE cterm=NONE guifg=#b5cea8 guibg=NONE gui=NONE
hi cssCommonAttr                ctermfg=151  ctermbg=NONE cterm=NONE guifg=#b5cea8 guibg=NONE gui=NONE
hi cssBraces                    ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE    guibg=NONE gui=NONE

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
