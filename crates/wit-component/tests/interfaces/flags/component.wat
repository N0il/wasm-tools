(component
  (type (;0;) (flags "b0"))
  (type (;1;) (flags "b0" "b1"))
  (type (;2;) (flags "b0" "b1" "b2" "b3"))
  (type (;3;) (flags "b0" "b1" "b2" "b3" "b4" "b5" "b6" "b7"))
  (type (;4;) (flags "b0" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "b10" "b11" "b12" "b13" "b14" "b15"))
  (type (;5;) (flags "b0" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "b10" "b11" "b12" "b13" "b14" "b15" "b16" "b17" "b18" "b19" "b20" "b21" "b22" "b23" "b24" "b25" "b26" "b27" "b28" "b29" "b30" "b31"))
  (type (;6;) (flags "b0" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "b10" "b11" "b12" "b13" "b14" "b15" "b16" "b17" "b18" "b19" "b20" "b21" "b22" "b23" "b24" "b25" "b26" "b27" "b28" "b29" "b30" "b31" "b32" "b33" "b34" "b35" "b36" "b37" "b38" "b39" "b40" "b41" "b42" "b43" "b44" "b45" "b46" "b47" "b48" "b49" "b50" "b51" "b52" "b53" "b54" "b55" "b56" "b57" "b58" "b59" "b60" "b61" "b62" "b63"))
  (type (;7;) (func (param "x" 0) (result 0)))
  (type (;8;) (func (param "x" 1) (result 1)))
  (type (;9;) (func (param "x" 2) (result 2)))
  (type (;10;) (func (param "x" 3) (result 3)))
  (type (;11;) (func (param "x" 4) (result 4)))
  (type (;12;) (func (param "x" 5) (result 5)))
  (type (;13;) (func (param "x" 6) (result 6)))
  (type (;14;)
    (instance
      (alias outer 1 0 (type (;0;)))
      (export "flag1" (type (eq 0)))
      (alias outer 1 1 (type (;1;)))
      (export "flag2" (type (eq 1)))
      (alias outer 1 2 (type (;2;)))
      (export "flag4" (type (eq 2)))
      (alias outer 1 3 (type (;3;)))
      (export "flag8" (type (eq 3)))
      (alias outer 1 4 (type (;4;)))
      (export "flag16" (type (eq 4)))
      (alias outer 1 5 (type (;5;)))
      (export "flag32" (type (eq 5)))
      (alias outer 1 6 (type (;6;)))
      (export "flag64" (type (eq 6)))
      (alias outer 1 7 (type (;7;)))
      (export "roundtrip-flag1" (func (type 7)))
      (alias outer 1 8 (type (;8;)))
      (export "roundtrip-flag2" (func (type 8)))
      (alias outer 1 9 (type (;9;)))
      (export "roundtrip-flag4" (func (type 9)))
      (alias outer 1 10 (type (;10;)))
      (export "roundtrip-flag8" (func (type 10)))
      (alias outer 1 11 (type (;11;)))
      (export "roundtrip-flag16" (func (type 11)))
      (alias outer 1 12 (type (;12;)))
      (export "roundtrip-flag32" (func (type 12)))
      (alias outer 1 13 (type (;13;)))
      (export "roundtrip-flag64" (func (type 13)))
    )
  )
  (import "imports" (instance (;0;) (type 14)))
  (core module (;0;)
    (type (;0;) (func (param i32) (result i32)))
    (type (;1;) (func (param i32 i32 i32)))
    (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
    (import "imports" "roundtrip-flag1" (func (;0;) (type 0)))
    (import "imports" "roundtrip-flag2" (func (;1;) (type 0)))
    (import "imports" "roundtrip-flag4" (func (;2;) (type 0)))
    (import "imports" "roundtrip-flag8" (func (;3;) (type 0)))
    (import "imports" "roundtrip-flag16" (func (;4;) (type 0)))
    (import "imports" "roundtrip-flag32" (func (;5;) (type 0)))
    (import "imports" "roundtrip-flag64" (func (;6;) (type 1)))
    (func (;7;) (type 2) (param i32 i32 i32 i32) (result i32)
      unreachable
    )
    (memory (;0;) 0)
    (export "memory" (memory 0))
    (export "cabi_realloc" (func 7))
  )
  (core module (;1;)
    (type (;0;) (func (param i32 i32 i32)))
    (func $indirect-imports-roundtrip-flag64 (;0;) (type 0) (param i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      i32.const 0
      call_indirect (type 0)
    )
    (table (;0;) 1 1 funcref)
    (export "0" (func $indirect-imports-roundtrip-flag64))
    (export "$imports" (table 0))
  )
  (core module (;2;)
    (type (;0;) (func (param i32 i32 i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "$imports" (table (;0;) 1 1 funcref))
    (elem (;0;) (i32.const 0) func 0)
  )
  (core instance (;0;) (instantiate 1))
  (alias core export 0 "0" (core func (;0;)))
  (alias export 0 "roundtrip-flag1" (func (;0;)))
  (core func (;1;) (canon lower (func 0)))
  (alias export 0 "roundtrip-flag2" (func (;1;)))
  (core func (;2;) (canon lower (func 1)))
  (alias export 0 "roundtrip-flag4" (func (;2;)))
  (core func (;3;) (canon lower (func 2)))
  (alias export 0 "roundtrip-flag8" (func (;3;)))
  (core func (;4;) (canon lower (func 3)))
  (alias export 0 "roundtrip-flag16" (func (;4;)))
  (core func (;5;) (canon lower (func 4)))
  (alias export 0 "roundtrip-flag32" (func (;5;)))
  (core func (;6;) (canon lower (func 5)))
  (core instance (;1;)
    (export "roundtrip-flag64" (func 0))
    (export "roundtrip-flag1" (func 1))
    (export "roundtrip-flag2" (func 2))
    (export "roundtrip-flag4" (func 3))
    (export "roundtrip-flag8" (func 4))
    (export "roundtrip-flag16" (func 5))
    (export "roundtrip-flag32" (func 6))
  )
  (core instance (;2;) (instantiate 0
      (with "imports" (instance 1))
    )
  )
  (alias core export 2 "memory" (core memory (;0;)))
  (alias core export 2 "cabi_realloc" (core func (;7;)))
  (alias core export 0 "$imports" (core table (;0;)))
  (alias export 0 "roundtrip-flag64" (func (;6;)))
  (core func (;8;) (canon lower (func 6) (memory 0)))
  (core instance (;3;)
    (export "$imports" (table 0))
    (export "0" (func 8))
  )
  (core instance (;4;) (instantiate 2
      (with "" (instance 3))
    )
  )
)