(module
  ;;imports must occur before all non-import definitions
  (import "host" "print"(func $log (param i32)))
  ;; Define a single page memory of 64KB.
  (memory $0 1)
  ;;Use function export name to pad GBA game to offset(h) B0
  (export "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" (func $r))
  ;;(export "\00\00\00\00\00\00\00\00\00\00" (func $a))
  ;;GBA 504 bytes as embedded data section
  (data (i32.const 0) "\30\31\96\00\00\00\00\00\00\00\00\00\00\F0\00\00\12\00\A0\E3\00\F0\29\E1\2C\D0\9F\E5\1F\00\A0\E3\00\F0\29\E1\24\D0\9F\E5\01\03\A0\E3\20\10\9F\E5\04\10\00\E5\01\10\A0\E3\08\12\80\E5\14\30\9F\E5\13\FF\2F\E1\10\00\9F\E5\10\FF\2F\E1\00\00\00\03\00\04\00\03\F4\00\00\08\54\01\00\08\10\01\00\08\00\48\2D\E9\34\C0\9F\E5\FF\E0\A0\E3\00\20\A0\E3\01\00\A0\E3\FF\EC\8E\E3\B0\10\DC\E1\0E\00\52\E3\00\48\BD\08\1E\FF\2F\01\0E\30\02\E0\01\20\82\E2\10\03\11\E1\10\33\A0\11\B0\30\CC\11\F6\FF\FF\EA\02\02\00\04\88\00\9F\E5\88\10\9F\E5\00\20\A0\E3\00\00\51\E1\01\00\00\0A\04\20\80\E4\FB\FF\FF\EA\74\00\9F\E5\74\10\9F\E5\74\20\9F\E5\00\00\52\E1\02\00\00\0A\04\30\91\E4\04\30\80\E4\FA\FF\FF\EA\01\03\A0\E3\03\10\A0\E3\00\C0\A0\E3\3E\2E\A0\E3\00\10\C0\E5\41\03\A0\E3\04\10\A0\E3\00\10\C0\E5\06\14\A0\E3\F0\00\5C\E3\1E\FF\2F\01\00\30\A0\E3\4B\0B\53\E3\03\00\00\0A\03\00\81\E0\1E\3E\83\E2\B0\20\C0\E1\F9\FF\FF\EA\02\10\81\E2\01\C0\8C\E2\F3\FF\FF\EA\00\0C\00\03\00\0C\00\03\00\0C\00\03\F8\01\00\08\00\0C\00\03")
  ;;Store string in 64kb allocated block of memory
  ;;7Z
  ;;Prepend 7Zip file with FF so that value at compiled offset A7 is not a valid GBA opcode that allows skipping header
  (data (i32.const 0) "\FF\37\7A\BC\AF\27\1C\00\04\E7\8D\33\50\00\00\00\00\00\00\00\00\2A\00\00\00\00\00\00\00\51\45\9B\61\01\05\01\0E\01\80\0F\01\80\19\02\00\00\11\05\00\61\00\00\00\14\0A\01\00\E6\72\35\C7\72\67\D7\01\15\06\01\00\20\00\00\00\00\00")
  ;;Function that returns i32 0x2
  (func $r
    i32.const 2
    ;;Call imported console log
    call $log
  )
  ;;Default WASM Instantiation
  (start $r)
)