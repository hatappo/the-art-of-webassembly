(module
  ;; console.log() する、いつもの関数を JS 側からインポート
  ;; ただし、今回の JS 側の実装は console.log() ではなく DOM を操作して HTML に文字列を書き込む。
  (import "env" "log_add_message"
    (func $log_add_message (param i32 i32 i32)))

  ;; 引数の2つの数値を足し算する関数。結果を JS 側の log_add_message 関数に渡す。 JS 側にエクスポートしている。
  (func (export "add_message")
    (param $a i32) (param $b i32)
    (local $sum i32)

    local.get $a
    local.get $b
    i32.add
    local.set $sum

    ;; JS 側からインポートした、DOM を操作して HTML に文字列を書き込む関数を呼び出す。
    (call $log_add_message
      (local.get $a) (local.get $b) (local.get $sum))
  )
)