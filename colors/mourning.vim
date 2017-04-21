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
