(module
 (type $0 (func (param i32)))
 (type $1 (func (param i32 i32 i32 i32)))
 (type $2 (func))
 (import "as_hello" "console_log" (func $as_hello/console_log (param i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 32828))
 (memory $0 1)
 (data $0 (i32.const 12) ",")
 (data $0.1 (i32.const 24) "\02\00\00\00\18\00\00\00h\00e\00l\00l\00o\00 \00w\00o\00r\00l\00d\00!")
 (export "HelloWorld" (func $as_hello/HelloWorld))
 (export "memory" (memory $0))
 (func $as_hello/HelloWorld
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 60
  i32.lt_s
  if
   i32.const 32848
   i32.const 32896
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.store
  i32.const 32
  call $as_hello/console_log
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
)
