(component
  (type (;0;) (func))
  (import "a" (func (;0;) (type 0)))
  (component (;0;)
    (type (;0;) (func))
    (import "a" (func (;0;) (type 0)))
    (type (;1;)
      (instance)
    )
    (import "locked-dep=<foo:add@1.0.0>" (instance (;0;) (type 1)))
  )
  (component (;1;)
    (instance (;0;))
  )
  (instance (;0;) (instantiate 1))
  (instance (;1;) (instantiate 0
      (with "locked-dep=<foo:add@1.0.0>" (instance 0))
      (with "a" (func 0))
    )
  )
)
