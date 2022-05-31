" Highlights these words
syn match asmMacro "fword"
syn match asmMacro "qword"
syn match asmMacro "dword"
syn match asmMacro "byte"
syn match asmMacro "ptr"

highlight link asmMacro Macro

" Highlights registers
syn match asmRegister "\<[re]\?[abcd][xhl]\>"
syn match asmRegister "\<[re]\?[sd]il\?\>"
syn match asmRegister "\<[re]\?[sbi]pl\?\>"
syn match asmRegister "\<r[0-9]\+[dwb]\?\>"
syn match asmRegister "[^\t]\<[cdefgs]s\>"hs=s+1

highlight link asmRegister StorageClass
