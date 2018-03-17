" Generated by Color Theme Generator at Sweyla
" http://sweyla.com/themes/seed/702209/

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

" Set environment to 256 colours
set t_Co=256

let colors_name = "ohgen004"

if version >= 700
  hi CursorLine     guibg=#000600 ctermbg=16
  hi CursorColumn   guibg=#000600 ctermbg=16
  hi MatchParen     guifg=#FF7B42 guibg=#000600 gui=bold ctermfg=209 ctermbg=16 cterm=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232 ctermfg=255 ctermbg=236
  hi PmenuSel       guifg=#FFFFFF guibg=#7674A1 ctermfg=255 ctermbg=243
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF ctermbg=255 gui=NONE
hi Normal           guifg=#FFFFFF guibg=#000600 gui=NONE ctermfg=255 ctermbg=16 cterm=NONE
hi NonText          guifg=#FFFFFF guibg=#0F150F gui=NONE ctermfg=255 ctermbg=233 cterm=NONE
hi LineNr           guifg=#303530 guibg=#191F19 gui=NONE ctermfg=236 ctermbg=234 cterm=NONE
hi StatusLine       guifg=#FFFFFF guibg=#171C20 gui=italic ctermfg=255 ctermbg=234 cterm=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#282E28 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
hi VertSplit        guifg=#FFFFFF guibg=#191F19 gui=NONE ctermfg=255 ctermbg=234 cterm=NONE
hi Folded           guifg=#FFFFFF guibg=#000600 gui=NONE ctermfg=255 ctermbg=16 cterm=NONE
hi Title            guifg=#7674A1 guibg=NONE	gui=bold ctermfg=243 ctermbg=NONE cterm=bold
hi Visual           guifg=#A39B8B guibg=#323232 gui=NONE ctermfg=247 ctermbg=236 cterm=NONE
hi SpecialKey       guifg=#EB9D76 guibg=#0F150F gui=NONE ctermfg=180 ctermbg=233 cterm=NONE
"hi DiffChange       guibg=#4C5000 gui=NONE ctermbg=58 cterm=NONE
"hi DiffAdd          guibg=#25294C gui=NONE ctermbg=235 cterm=NONE
"hi DiffText         guibg=#663566 gui=NONE ctermbg=241 cterm=NONE
"hi DiffDelete       guibg=#3F0400 gui=NONE ctermbg=52 cterm=NONE
 
hi DiffChange       guibg=#4C4C09 gui=NONE ctermbg=234 cterm=NONE
hi DiffAdd          guibg=#252556 gui=NONE ctermbg=17 cterm=NONE
hi DiffText         guibg=#66326E gui=NONE ctermbg=22 cterm=NONE
hi DiffDelete       guibg=#3F000A gui=NONE ctermbg=0 ctermfg=196 cterm=NONE
hi TabLineFill      guibg=#5E5E5E gui=NONE ctermbg=235 ctermfg=228 cterm=NONE
hi TabLineSel       guifg=#A39B8B gui=bold ctermfg=247 cterm=bold


" Syntax highlighting
hi Comment guifg=#7674A1 gui=NONE ctermfg=243 cterm=NONE
hi Constant guifg=#EB9D76 gui=NONE ctermfg=180 cterm=NONE
hi Number guifg=#EB9D76 gui=NONE ctermfg=180 cterm=NONE
hi Identifier guifg=#00B24C gui=NONE ctermfg=35 cterm=NONE
hi Statement guifg=#FF7B42 gui=NONE ctermfg=209 cterm=NONE
hi Function guifg=#A49400 gui=NONE ctermfg=136 cterm=NONE
hi Special guifg=#B57F9F gui=NONE ctermfg=139 cterm=NONE
hi PreProc guifg=#B57F9F gui=NONE ctermfg=139 cterm=NONE
hi Keyword guifg=#FF7B42 gui=NONE ctermfg=209 cterm=NONE
hi String guifg=#A39B8B gui=NONE ctermfg=247 cterm=NONE
hi Type guifg=#FFFFFC gui=NONE ctermfg=231 cterm=NONE
hi pythonBuiltin guifg=#00B24C gui=NONE ctermfg=35 cterm=NONE
hi TabLineFill guifg=#414137 gui=NONE ctermfg=237 cterm=NONE

