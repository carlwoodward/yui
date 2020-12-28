" Name:         Yui
" Version:      0.16.0
" Author:       Florian B <yuuki@protonmail.com>
" Maintainer:   Florian B <yuuki@protonmail.com>
" License:      Vim License (see `:help license`)
" Last Updated: Mon Jul 27 17:27:26 2020

" YUI only supports a light background
set background=light

" The gui_running check is only meaningful in Vim, but I'm trying to support
" both.
" https://github.com/equalsraf/neovim-qt/issues/102#issuecomment-191054445
if !has('gui_running') && &t_Co < 256
  finish
endif

hi clear

" Many color schemes use syntax_on but :help mentions g:syntax_on. The answer
" is: it doesn't matter. :help internal-variables explains that without a
" prefix the name will use the global namespace
if exists('g:syntax_on')
  " Activate the default colors again so we start from a blank slate
  syntax reset
endif

" Set the name of the colorscheme
let g:colors_name = 'yui'

" ============== COLOR PALETTE ==================
" Use shades of the foreground and background for differentiating elemens
" without colors.
" Use colors sparingly, such as for Git diffs.
" #004AB3 - Blue
" #4D4000 - Yellow
" #751400 - Red
" #304D00 - Green
" #DBF9FF - Light Cyan
" #FFF5C4 - Light Yellow
" #F2FFDB - Light Green
" #FFDBE7 - Light Magenta
" #DBEAFF - Light Blue
" #FFCABF - Light Red
"
" Special accent colors
" #B30000 - Salmon 35%
" #700000 - Salmon 22%
" #FFE6E6 - Light Salmon 95%
" #FFB3B3 - Light Salmon 85%

" Make sure the contrast ratio for the default BG and FG pair is AAA
" https://webaim.org/resources/contrastchecker/
" Normal BG Lightness
" #FFFFFF - 100% hsl(12, 20%, 100%)
" #F5F1F0 - 95% DEFAULT BG
" #EBE2E0 - 90%
" #E0D4D1 - 85%
" #D6C6C2 - 80%
"
" Normal FG Lightness
" #FFFFFF - 100% hsl(14, 8%, 100%)
" #B9AFAC - 70%
" #8A7A75 - 50%
" #6e625e - 40%
" #534946 - 30% DEFAULT
" #292523 - 15%
" #1c1817 - 10%
hi! Normal guibg=#F5F1F0 guifg=#534946 guisp=NONE

" -------------- Cursor Stuff -------------------
  hi! CursorLineNr guibg=#FFFFFF guifg=#534946 gui=NONE
  " v-- If you don't set guifg CursorLine bg will have a lower priority than
  " e.g., comments (or any other bg color)
  " https://github.com/neovim/neovim/issues/7383
  hi! CursorLine guibg=#FFFFFF guifg=fg gui=NONE
  hi! Cursor guifg=bg guibg=fg guisp=NONE gui=NONE
  hi! link CursorIM Cursor
  hi! link lCursor Cursor

" -------------- Left Sidebar -------------------
  hi! ColorColumn guibg=NONE guifg=NONE gui=NONE
  hi! SignColumn guibg=NONE gui=NONE
  hi! LineNr guibg=NONE guifg=#958783 gui=NONE

" -------------- Statusline ---------------------
  hi! StatusLine guifg=bg guibg=fg gui=bold guisp=NONE
  hi! StatusLineNC guibg=#E0D4D1 guifg=fg gui=NONE guisp=NONE
  hi! WildMenu guibg=#FFFFFF guifg=fg guisp=NONE gui=NONE

" -------------- Tabline ------------------------
  " v-- AA only but okay since it's not supposed to be in focus
  hi! TabLine guibg=NONE guifg=NONE gui=NONE guisp=NONE
  hi! link TabLineFill TabLine
  hi! TabLineSel guibg=NONE guifg=NONE guisp=NONE gui=bold,underline
  " v-- This is for the number of panes in the current tab shown in the top
  " left corner
  hi! link Title TabLineSel

" -------------- Folds --------------------------
  " v-- AA
  " hi! Folded guibg=#E0D4D1 guifg=#8A7A75 guisp=NONE gui=NONE
  hi! Folded guibg=NONE guifg=#8A7A75 guisp=NONE gui=NONE
  hi! link FoldColumn Folded

" -------------- Completion Menu (PMenu) --------
  hi! Pmenu guifg=NONE guibg=#EBE2E0 guisp=NONE gui=NONE
  hi! PmenuThumb guifg=NONE guibg=fg guisp=NONE gui=NONE
  hi! link PmenuSbar PMenu
  hi! PmenuSel guibg=#FFFFFF guifg=fg guisp=NONE gui=NONE

" -------------- Terminal -----------------------
  hi! link TermCursor Cursor
  hi! TermCursorNC guifg=bg guibg=#8A7A75

" -------------- Whatever -----------------------
  " v-- Strangely, this affects the attributes in the command line doing :hi
  hi! Directory guifg=NONE guibg=NONE guisp=NONE gui=underline
  hi! link ErrorMsg Error
  hi! VertSplit guibg=#B9AFAC guifg=bg
  hi! link EndOfBuffer LineNr
  hi! link NonText Whitespace
  " I don't like concealed text that isn't somehow differentiated from the
  " rest of the text. I've actually been bitten by this when hastily editing
  " CSV files and what I thought were | were actually , in disguise
  hi! Conceal guifg=NONE guibg=NONE guisp=NONE gui=undercurl
  hi! MatchParen guifg=NONE guibg=NONE guisp=NONE gui=underline
  hi! link ModeMsg Normal
  hi! link MoreMsg Normal
  hi! link MsgArea Normal
  hi! link MsgSeparator Normal
  hi! link NormalFloat Normal
  hi! link NormalNC Normal
  " This is not just a different hue from the other light palette colors, it's
  " also slightly more saturated. Yellow is really hard to see on a light grey
  " background.
  hi! WarningMsg guibg=#FFF5C4 guifg=#4D4000 gui=bold
  " v-- Not even AA since I want these characters to fade away
  hi! Whitespace guifg=#B9AFAC guibg=NONE guisp=NONE gui=NONE
  " v-- I'm not really sure how this is different from Whitespace
  hi! link SpecialKey Whitespace
  hi! Visual guifg=#292523 guibg=#D6C6C2 guisp=NONE gui=NONE
  " v-- I don't know which actions trigger VisualNOS
  hi! link VisualNOS Visual
  hi! link Question Normal

" -------------- Spellchecker -------------------
  hi! link SpellBad ErrorMsg
  hi! SpellCap guifg=NONE guibg=NONE guisp=NONE gui=underline
  hi! SpellLocal guifg=NONE guibg=NONE guisp=NONE gui=underline
  hi! SpellRare guifg=NONE guibg=NONE guisp=NONE gui=underline

" -------------- VIM Only -----------------------
if !has('nvim')
  hi! Tooltip guifg=#534946 guibg=#EBE2E0
  hi! Menu guifg=#534946 guibg=#EBE2E0
endif

" -------------- Diffs --------------------------
  hi! DiffAdd guifg=#304D00 guibg=#F2FFDB guisp=NONE gui=NONE
  hi! DiffChange guifg=#4D4000 guibg=#FFF5C4 guisp=NONE gui=NONE
  hi! DiffText guifg=#4D4000 guibg=#FFF5C4 guisp=NONE gui=bold
  hi! DiffDelete guifg=#751400 guibg=#FFCABF guisp=NONE gui=NONE

" -------------- Search & Replace ---------------
  hi! IncSearch guibg=#FFB3B3 guifg=#700000 guisp=NONE gui=bold
  " hi! IncSearch guibg=#DBEAFF guifg=#004AB3 guisp=NONE gui=NONE
  hi! Search guibg=#FFE6E6 guifg=#B30000 guisp=NONE gui=NONE
  " hi! Search guibg=#E0D4D1 guifg=NONE guisp=NONE gui=NONE
  " hi! Substitute guibg=NONE guifg=NONE guisp=NONE gui=underline
  hi! link Substitute IncSearch

" -------------- Preferred groups ---------------
  " :h group-name
  " hi! Comment guibg=NONE guifg=#004AB3 guisp=NONE gui=italic
  hi! Comment guibg=#EBE2E0 guifg=fg guisp=NONE gui=italic
  " hi! Comment guibg=NONE guifg=#1c1817 guisp=NONE gui=italic
  hi! Identifier guibg=NONE guifg=#534946 guisp=NONE gui=NONE
  hi! Constant guibg=NONE guifg=#534946 guisp=NONE gui=bold
  hi! Statement guibg=NONE guifg=#534946 guisp=NONE gui=NONE
  hi! PreProc guibg=NONE guifg=#534946 guisp=NONE gui=NONE
  hi! Type guibg=NONE guifg=#534946 guisp=NONE gui=italic
  hi! Special guibg=NONE guifg=#534946 guisp=NONE gui=NONE
  hi! Underlined guibg=NONE guifg=#534946 guisp=NONE gui=underline
  " For these colors I typically use a darker lightness of the bg for the fg
  hi! Error guibg=#FFCABF guifg=#751400 guisp=NONE gui=bold
  hi! link Todo WarningMsg
  hi! Ignore guibg=#F5F1F0 guifg=#534946 guisp=NONE gui=NONE

" -------------- More granular groups -----------
" -------------- XML ----------------------------
  hi! link xmlProcessingDelim Normal
  hi xmlTagName guifg=NONE guibg=NONE guisp=NONE gui=NONE

" -------------- Vim Script ---------------------
  " v-- These are normally linked to Type, which is italicized, leading to
  " lots of italics in this file
  hi! link vimGroup Normal
  hi! link vimHiGui Normal
  hi! link vimHiGroup Normal
  hi! link vimHiGuiFgBg Normal
  hi! vimCommentTitle guifg=NONE guibg=#EBE2E0 guisp=NONE gui=underline
  hi! vimCommentTitleLeader guifg=NONE guibg=#EBE2E0 guisp=NONE gui=NONE

" -------------- Help Text ----------------------
  hi! helpHyperTextJump guifg=NONE guifg=NONE gui=underline guisp=NONE
  " v-- Making this underlined can have weird effects since sometimes a
  " helpHeadline is empty and then you just have a weird line
  hi! helpHeadline guifg=NONE guibg=NONE guisp=NONE gui=bold

" -------------- vim-sneak ----------------------
  hi! link Sneak Visual
  hi! link SneakScope IncSearch
  " v-- For all matches except the first, where the cursor currently resides
  hi! link SneakLabel Search

" -------------- vim-dirvish --------------------
   " v-- items added to the arglist
   hi! link DirvishArg Search
   " v-- directories
   hi! DirvishPathTail guifg=NONE guibg=NONE guisp=NONE gui=bold
