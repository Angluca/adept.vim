if exists("b:current_syntax")
    finish
endif

syn keyword adeptKeyword enum extends
syn keyword adeptKeyword in
syn keyword adeptKeyword new
syn keyword adeptKeyword private
syn keyword adeptKeyword super
syn keyword adeptKeyword type
syn keyword adeptKeyword var const define record
syn keyword adeptInclude public internal foreign pragma

syn keyword adeptInclude import export

syn keyword adeptLabel case match
syn keyword adeptRepeat for while
syn keyword adeptStatement break continue return goto defer
syn keyword adeptConditional if else

syn keyword adeptType Array
syn keyword adeptType bool byte
syn keyword adeptType int
syn keyword adeptType long
syn keyword adeptType null
syn keyword adeptType string
syn keyword Boolean void true false

syn match adeptOperator "\v\-\>"
syn match adeptOperator "\v\=\>"
syn match adeptOperator "\v\:"

syn match SpecialComment  "#.*$"

" adapted from neovim runtime/syntax
syn keyword adeptTodo contained TODO FIXME XXX NOTE
syn region  adeptComment start="/\*" end="\*/" contains=adeptTodo,@Spell
syn match   adeptComment "//.*$" contains=adeptTodo,@Spell

syn match  adeptSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  adeptSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn region adeptString           start=+"+ end=+"+ end=+$+ contains=adeptSpecialChar,adeptSpecialCharError,@Spell
syn match  adeptCharacter        "'[^']*'" contains=adeptSpecialChar,adeptSpecialCharError
syn match  adeptCharacter        "'\\''" contains=adeptSpecialChar
syn match  adeptCharacter        "'[^\\]'"

syn match adeptNumber "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syn match adeptNumber "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syn match adeptNumber "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syn match adeptNumber "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"

syn match adeptFloat '\v<\.?\d+([eE][+-]?\d+)?(f32|f64)?>' display
syn match adeptFloat '\v<(0|[1-9]\d*)([eE][+-]?\d+)?(f32|f64)>' display
syn match adeptFloat '\v<0x\x+(\.\x+)?[pP][+-]?\d+(f32|f64)?>' display
" Integer literals
syn match adeptInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iu](8|16|32|64)?|z)?>' display
syn match adeptInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iu](8|16|32|64)?|z)?>' display
syn match adeptInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iu](8|16|32|64)?|z)?>' display
syn match adeptInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iu](8|16|32|64)?|z)?>' display
" Escape sequences
syn match adeptEscape '\\[\\'"0abfnrtv]' contained display
syn match adeptEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match adeptFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=adeptEscape display
syn match adeptFormat '{{\|}}' contained display


hi def link adeptFloat                 Number
hi def link adeptInteger               Number
hi def link adeptEscape                SpecialComment
hi def link adeptFormat                SpecialChar

hi def link adeptKeyword               Keyword
hi def link adeptInclude               Include
hi def link adeptLabel                 Label
hi def link adeptConditional           Conditional
hi def link adeptRepeat                Repeat
hi def link adeptStatement             Statement
"hi def link adeptType                  Type
hi def link adeptNumber                Number
hi def link adeptComment               Comment
hi def link adeptOperator              Operator
hi def link adeptCharacter             Character
hi def link adeptString                String
hi def link adeptTodo                  Todo
hi def link adeptSpecial               Special
hi def link adeptSpecialError          Error
hi def link adeptSpecialCharError      Error
hi def link adeptString                String
hi def link adeptCharacter             Character
hi def link adeptSpecialChar           SpecialChar
hi def link adeptException             Exception

syn match adeptType     '\(:\s*\(\s*\)*\**\(\[.*\]\)*\)\@<=\w\([0-9a-zA-Z_\* ]\)*'
syn match PreProc        '[@]'
syn match adeptSymbol    '[,;]'
syn match Operator       '[\+\-\%=\/\^\&\*!?><\$|]'
syn match SpecialComment '[`:\.]'
syn match Constant       '[{}\[\]()]'
hi def adeptSymbol ctermfg=DarkGray guifg=DarkGray

hi def link adeptFunc Function
hi def link adeptTypedef Identifier
hi def adeptType ctermfg=DarkCyan guifg=DarkCyan
"hi def adeptThis ctermfg=DarkMagenta guifg=DarkMagenta
hi def link adeptThis Exception
syn match PreProc  '\(^\s*\[\s*\)\@<=\w\w*\ze\s*.*\]'
syn match Repeat   "\([^\.]\.\|\\\)\@<=\w\w*\(\(\[.*\]\)*\s*(\)\@!"
syn match Float    "\([0-9]\+\.\)\@<=[0-9][0-9]*\(f32\|f64\)*"
syn match adeptThis '\(\w\)\@<!this\(\w\)\@!'
"syn match adeptType '\(\w\w*\s*\)\@<=\w\w*'
syn match adeptType '\(\s*\w\w*\s\)\zs\(\s*\w\w*\s*\)\+'
"syn match adeptType '\(\s*\w\w*\s\+\**\)\@!\(\s*\w\w*\s*\)\+'
"syn match adeptType '\(\(\W\|^\)\(var\|const\|def\)\s\+[^=]*\w\s*)*\s*:\s*\W*\|^\W*\w\w*\s*:\w*\)\@<=\w\+'
syn match adeptTypedef  contains=adeptTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match adeptFunc    "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
"syn keyword Keyword   def nextgroup=Function skipwhite skipempty
syn keyword adeptKeyword union class struct enum namespace typedef trait @note nextgroup=adeptTypedef skipwhite skipempty
syn keyword adeptKeyword union nextgroup=adeptType skipwhite skipempty contained
syn match adeptFunc    "\w\(\w\)*\ze\(\[.*\]\s*\)*\s*("
"syn match adeptType    "\w\(\w\)*<"he=e-1,me=e-1 " foo<T>();
syn match adeptType    "\w\(\w\)*\ze\(<.*>\s*\)*::[^<]"
syn match Repeat       "\(\\\)\@<=\w\(\w\)*"
syn match adeptFunc   "[0-9a-zA-Z_@]*\w\w*\(\(<.*>\s*\)*\(\[.*\]\)*\s*(\)\@="
syn match Repeat        "\([^\.]\.\)\@<=\w\w*\(\(\[.*\]\)*\_s*\)\@!"
syn match adeptKeyword  "@\w\(\w\)*"
syn match adeptKeyword  "#\w\(\w\)*"
syn match adeptType  "\(<.*>\)\@<=\(\s*\w\(\w\)*\)\+"
syn match adeptType '\(\sas\s\+\W*\)\@<=\w\w*'
syn match PreProc '\(\*\)\@<=\w\w*'


syn region  adeptComment start="/\*" end="\*/" contains=adeptTodo,@Spell
syn match   adeptComment "//.*$" contains=adeptTodo,@Spell
syn region  SpecialComment start="\"\"\"" end="\"\"\"" contains=adeptTodo,@Spell
syn keyword adeptKeyword func
syn keyword adeptKeyword as

let b:current_syntax = "adept"
