(module
  (import "js" "log_stack_trace" (func $log_stack_trace (param i32)))

  ;; サンプルの関数： JS の console.trace を呼び出す
  (func $call_level_1 (param $level i32)
    local.get $level
    call $log_stack_trace
  )

  ;; サンプルの関数： ↑ の関数を呼び出す
  (func $call_level_2 (param $level i32)
    local.get $level
    call $call_level_1
  )

  ;; サンプルの関数： ↑ の関数を呼び出す
  (func $call_level_3 (param $level i32)
    local.get $level
    call $call_level_2
  )

  ;; いろんな呼び出しネストのレベルの関数を順に試している関数
  (func $call_stack_trace (export "call_stack_trace")
    (call $log_stack_trace (i32.const 0))
    (call $call_level_1 (i32.const 1))
    (call $call_level_2 (i32.const 2))
    (call $call_level_3 (i32.const 3))
  )
)
