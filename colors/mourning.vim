" mourning colorscheme
"
" Maintainer:	Zak Johnson <me@zakj.net>
" Last Change:	2017-04-20
" URL: https://github.com/zakj/mourning

" Setup.  {{{1
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'mourning'


" HL helper function.  {{{1
let s:NULL = {'sentinel': 'until v:null support is universal'}
function! s:HL(group, fg, ...)
  let [l:fg, l:bg, l:style, l:guisp] = [a:fg, s:NULL, s:NULL, s:NULL]
  if a:0 >= 1
    unlet l:bg | let l:bg = a:1
  endif
  if a:0 >= 2
    unlet l:style | let l:style = a:2
  endif
  if a:0 >= 3
    unlet l:guisp | let l:guisp = a:3
  endif

  let cmd = ['hi', a:group, 'NONE']

  if type(l:fg) == type('')
    let cmd += ['ctermfg=' . l:fg, 'guifg=' . l:fg]
  elseif type(l:fg) == type([])
    let cmd += ['ctermfg=' . l:fg[0], 'guifg=' . l:fg[1]]
  endif

  if type(l:bg) == type('')
    let cmd += ['ctermbg=' . l:bg, 'guibg=' . l:bg]
  elseif type(l:bg) == type([])
    let cmd += ['ctermbg=' . l:bg[0], 'guibg=' . l:bg[1]]
  endif

  if type(l:style) == type('')
    let cmd += ['cterm=' . l:style, 'gui=' . l:style]
  endif

  if type(l:guisp) == type('')
    let cmd += ['guisp='. l:guisp]
  endif

  execute join(cmd)
endfunction


" Color palette.  {{{1
let s:c = {}

let s:c.black =        [232, '#080808']
let s:c.mineshaft0 =   [234, '#1c1c1c']
let s:c.mineshaft1 =   [235, '#262626']
let s:c.mineshaft2 =   [237, '#3a3a3a']
let s:c.boulder =      [240, '#585858']
let s:c.grey =         [245, '#8a8a8a']
let s:c.silver =       [250, '#bcbcbc']
let s:c.white =        [254, '#e4e4e4']

let s:c.orient =       [ 24, '#005f87']
"XXX let s:c.deep_sea =     [ 29, '#00875f']
let s:c.malibu =       [ 75, '#5fafff']
let s:c.bright_green = [ 84, '#5fff87']
let s:c.mint_green =   [121, '#87ffaf']
let s:c.red =          [160, '#d70000']
let s:c.green_yellow = [155, '#afff5f']

let s:c.bittersweet =  [203, '#ff5f5f']


" General VIM chrome.  {{{1
" :help highlight-default

call s:HL('Normal', s:c.grey, s:c.mineshaft0)

call s:HL('ColorColumn', s:NULL, s:c.mineshaft1)
" TODO: Conceal

call s:HL('Cursor', s:c.black, s:c.bright_green)
for group in ['CursorColumn', 'CursorLine']
  call s:HL(group, s:NULL, s:c.black)
endfor

call s:HL('Directory', s:c.orient)  " TODO: brighter blue?
call s:HL('DiffAdd', s:NULL, s:c.mineshaft1)
call s:HL('DiffChange', s:NULL, s:c.mineshaft1)
call s:HL('DiffDelete', s:c.mineshaft0, s:c.black)
call s:HL('DiffText', s:NULL, s:c.mineshaft2)
call s:HL('ErrorMsg', s:c.white, s:c.red)
call s:HL('VertSplit', s:c.black)
call s:HL('Folded', s:c.orient)

call s:HL('StatusLine', s:c.white, s:c.black)
for group in ['FoldColumn', 'SignColumn', 'LineNr', 'StatusLineNC']
  call s:HL(group, s:c.mineshaft1, s:c.black)
endfor
call s:HL('CursorLineNr', 'fg', s:c.black)

for group in ['Search', 'IncSearch']
  call s:HL(group, s:c.black, s:c.green_yellow)
endfor

call s:HL('MatchParen', s:c.bright_green, s:NULL, 'bold')
call s:HL('ModeMsg', s:NULL, s:NULL, 'bold')
call s:HL('MoreMsg', s:c.white, s:NULL, 'bold')
call s:HL('NonText', s:c.orient)
call s:HL('Pmenu', s:c.black, s:c.grey)  " TODO: orig 235/242
call s:HL('PmenuSel', s:c.white, s:c.orient)  " TODO: orig 0/25
call s:HL('PmenuSbar', s:NULL, s:c.silver)
call s:HL('PmenuThumb', s:NULL, s:c.white)
call s:HL('Question', s:c.mint_green, s:NULL, 'bold')
call s:HL('SpecialKey', s:c.orient)

" TODO
" SpellBad	Word that is not recognized by the spellchecker. |spell|
" 		This will be combined with the highlighting used otherwise.
" SpellCap	Word that should start with a capital. |spell|
" 		This will be combined with the highlighting used otherwise.
" SpellLocal	Word that is recognized by the spellchecker as one that is
" 		used in another region. |spell|
" 		This will be combined with the highlighting used otherwise.
" SpellRare	Word that is recognized by the spellchecker as one that is
" 		hardly ever used. |spell|
" 		This will be combined with the highlighting used otherwise.

call s:HL('TabLine', s:c.grey, s:c.black)
call s:HL('TabLineFill', s:NULL, s:c.black)
call s:HL('TabLineSel', s:c.white, s:c.mineshaft0, 'bold')
call s:HL('Title', s:c.white, s:NULL, 'bold')
call s:HL('Visual', s:c.black, s:c.malibu)
call s:HL('WarningMsg', s:c.bittersweet)  " TODO: refine
call s:HL('WildMenu', s:NULL, s:c.green_yellow)


" Syntax highlighting.  {{{1
" :help group-name
