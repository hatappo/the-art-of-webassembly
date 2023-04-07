(module
  (import "env" "log" (func $log (param i32 i32)))

  (func $loop_test (export "loop_test") (param $n i32)
    (result i32)

    (local $i i32)                        ;; $i = 0 に自動で初期化される。
    (local $factorial i32)                ;; $factorial = 0 に自動で初期化される。

    (local.set $factorial (i32.const 1))  ;; $factorial = 1 に変更。

    (loop $continue (block $break   ;; $continue ブロックと $break ブロック
      (local.set $i                 ;; $i++ （一番最初は 0 -> 1 になる）
        (i32.add (local.get $i) (i32.const 1))
      )

      ;; $i の階乗値
      (local.set $factorial         ;;  一番最初は 1x1 (-> 2x1 -> 3x2 -> 4x6 -> 5x24 ...)
        (i32.mul (local.get $i) (local.get $factorial))
      )
      
      ;; $log を呼び出し、パラメータ $i と $factorial を渡す
      (call $log (local.get $i) (local.get $factorial))

      (br_if $break
        ;; $i==$n の場合はループを抜ける
        (i32.eq (local.get $i) (local.get $n))
      )
      br $continue  ;; ループの先頭に分岐
    ))

    ;; $factorial を呼び出し元の Javascript に返す
    local.get $factorial
  )
)