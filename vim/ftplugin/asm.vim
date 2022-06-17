" Highlights qword, dword, fword, and word
syntax match asmMacro "\v[fqd]?word"
" Highlights these keywords
syntax keyword asmMacro byte ptr

highlight link asmMacro Macro

" Highlights registers
syntax match asmRegister "\<[re]\?[abcd][xhl]\>"
syntax match asmRegister "\<[re]\?[sd]il\?\>"
syntax match asmRegister "\<[re]\?[sbi]pl\?\>"
syntax match asmRegister "\<r[0-9]\+[dwb]\?\>"
syntax match asmRegister "[^\t]\<[cdefgs]s\>"hs=s+1

highlight link asmRegister StorageClass
