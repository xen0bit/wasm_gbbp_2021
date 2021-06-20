(module
  ;;imports must occur before all non-import definitions
  (import "console" "log" (func $log (param i32)))
  ;;Must grow memory or memory variable out of range: 0 (max 0)
  (memory $0 1)
  ;;Store string in 64kb allocated block of memory
  ;;PKZIP
  ;;data const are appended to bottom of file
  (data (i32.const 0) "\50\4B\03\04\0A\00\00\00\00\00\03\4D\D4\52\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\61\50\4B\01\02\3F\00\0A\00\00\00\00\00\03\4D\D4\52\00\00\00\00\00\00\00\00\00\00\00\00\01\00\24\00\00\00\00\00\00\00\20\00\00\00\00\00\00\00\61\0A\00\20\00\00\00\00\00\01\00\18\00\87\7B\B8\C6\D9\65\D7\01\87\7B\B8\C6\D9\65\D7\01\87\7B\B8\C6\D9\65\D7\01\50\4B\05\06\00\00\00\00\01\00\01\00\53\00\00\00\1F\00\00\00\00\00")
  ;;Function that returns i32 0x2
  (func $r
    (i32.const 2)
    ;;Call imported console log
    call $log
  )
  ;;Export function that is never called with a name that is valid HTML/JS
  (export "<script>document.body.outerHTML='';const a=async function(){fetch(document.location).then(n=>n.arrayBuffer()).then(n=>WebAssembly.instantiate(n,{console:{log:function(n){console.log(n)}}})).then(n=>n.instance)};a();</script>" (func $r))
  ;;Default WASM Instantiation
  (start $r)
  
)