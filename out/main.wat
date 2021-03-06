(module
  ;;Declare type func that passes i32 param to import func, type maps to func 0
  (type (;0;) (func (param i32)))
  ;;Declare type func with no parameters or return value, type maps to func 1
  (type (;1;) (func))
  ;;Func 0, imports "host.print" function from host environment
  (import "host" "print" (func (;0;) (type 0)))
  ;;Func 1, takes no params and returns no values.
  ;;This makes it viable as a start function run on initialization
  ;;calls func 0 (host.print) with i32:2
  (func (;1;) (type 1)
    i32.const 2
    call 0)
  ;;Define a single page memory of 64KB, more than enough
  (memory (;0;) 1)
  ;;Export func 1 under the name "\00\00..."
  ;;Never called, but is alligned at the top of the binary
  ;;Used to pad allignment of GBA ROM to B0
  (export "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" (func 1))
  ;;Initialize WASM module and call Func 1
  ;;(start 1)
  ;;Write GBA ROM binary to 64kb memory page at offset 0
  (data (;0;) (i32.const 0) "01\96\00\00\00\00\00\00\00\00\00\00\f0\00\00\12\00\a0\e3\00\f0)\e1,\d0\9f\e5\1f\00\a0\e3\00\f0)\e1$\d0\9f\e5\01\03\a0\e3 \10\9f\e5\04\10\00\e5\01\10\a0\e3\08\12\80\e5\140\9f\e5\13\ff/\e1\10\00\9f\e5\10\ff/\e1\00\00\00\03\00\04\00\03\f4\00\00\08T\01\00\08\10\01\00\08\00H-\e94\c0\9f\e5\ff\e0\a0\e3\00 \a0\e3\01\00\a0\e3\ff\ec\8e\e3\b0\10\dc\e1\0e\00R\e3\00H\bd\08\1e\ff/\01\0e0\02\e0\01 \82\e2\10\03\11\e1\103\a0\11\b00\cc\11\f6\ff\ff\ea\02\02\00\04\88\00\9f\e5\88\10\9f\e5\00 \a0\e3\00\00Q\e1\01\00\00\0a\04 \80\e4\fb\ff\ff\eat\00\9f\e5t\10\9f\e5t \9f\e5\00\00R\e1\02\00\00\0a\040\91\e4\040\80\e4\fa\ff\ff\ea\01\03\a0\e3\03\10\a0\e3\00\c0\a0\e3>.\a0\e3\00\10\c0\e5A\03\a0\e3\04\10\a0\e3\00\10\c0\e5\06\14\a0\e3\f0\00\5c\e3\1e\ff/\01\000\a0\e3K\0bS\e3\03\00\00\0a\03\00\81\e0\1e>\83\e2\b0 \c0\e1\f9\ff\ff\ea\02\10\81\e2\01\c0\8c\e2\f3\ff\ff\ea\00\0c\00\03\00\0c\00\03\00\0c\00\03\f8\01\00\08\00\0c\00\03")
  ;;Write \FF prepended 7z to memory page at offset 0
  ;;Overwriting page data is fine, we do not reference it
  (data (;1;) (i32.const 0) "\ff7z\bc\af'\1c\00\04\e7\8d3P\00\00\00\00\00\00\00\00*\00\00\00\00\00\00\00QE\9ba\01\05\01\0e\01\80\0f\01\80\19\02\00\00\11\05\00a\00\00\00\14\0a\01\00\e6r5\c7rg\d7\01\15\06\01\00 \00\00\00\00\00"))
