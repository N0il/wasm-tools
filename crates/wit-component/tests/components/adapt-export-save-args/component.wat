(component
  (core module (;0;)
    (type (;0;) (func))
    (type (;1;) (func (param i32)))
    (type (;2;) (func (result i32)))
    (import "__main_module__" "the_entrypoint" (func $entry (;0;) (type 0)))
    (func (;1;) (type 1) (param i32)
      local.get 0
      global.set $nargs
      call $entry
    )
    (func (;2;) (type 2) (result i32)
      global.get $nargs
    )
    (global $nargs (;0;) (mut i32) i32.const 0)
    (export "entrypoint" (func 1))
    (export "nargs" (func 2))
  )
  (type (;0;) (func (param "nargs" u32)))
  (core module (;1;)
    (type (;0;) (func (result i32)))
    (type (;1;) (func))
    (import "old" "nargs" (func (;0;) (type 0)))
    (func (;1;) (type 1))
    (export "the_entrypoint" (func 1))
  )
  (core module (;2;)
    (type (;0;) (func (result i32)))
    (func $adapt-old-nargs (;0;) (type 0) (result i32)
      i32.const 0
      call_indirect (type 0)
    )
    (table (;0;) 1 1 funcref)
    (export "0" (func $adapt-old-nargs))
    (export "$imports" (table 0))
  )
  (core module (;3;)
    (type (;0;) (func (result i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "$imports" (table (;0;) 1 1 funcref))
    (elem (;0;) (i32.const 0) func 0)
  )
  (core instance (;0;) (instantiate 2))
  (alias core export 0 "0" (core func (;0;)))
  (core instance (;1;)
    (export "nargs" (func 0))
  )
  (core instance (;2;) (instantiate 1
      (with "old" (instance 1))
    )
  )
  (alias core export 2 "the_entrypoint" (core func (;1;)))
  (core instance (;3;)
    (export "the_entrypoint" (func 1))
  )
  (core instance (;4;) (instantiate 0
      (with "__main_module__" (instance 3))
    )
  )
  (alias core export 0 "$imports" (core table (;0;)))
  (alias core export 4 "nargs" (core func (;2;)))
  (core instance (;5;)
    (export "$imports" (table 0))
    (export "0" (func 2))
  )
  (core instance (;6;) (instantiate 3
      (with "" (instance 5))
    )
  )
  (alias core export 4 "entrypoint" (core func (;3;)))
  (func (;0;) (type 0) (canon lift (core func 3)))
  (export "entrypoint" (func 0))
)