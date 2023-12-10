(module
  (import "js" "log_f64" (func $log_f64(param i32 f64)))

  (func $distance (export "distance")
    (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64)
    (result f64)
    (local $x_dist f64)
    (local $y_dist f64)

    local.get $x1
    local.get $x2
    f64.sub
    local.tee $x_dist ;; スタックの先頭の値（この場合は $x1 - $x2 ）を $x_dist にセットしつつスタックにも残す
    local.get $x_dist ;; $x_dist （つまり $x1 - $x2 ）をもう１つスタックに積む
    f64.mul           ;; それらを乗算する（つまり２乗している）

    local.get $y1
    local.get $y2
    f64.add           ;; sub コマンドの間違いで add している、とする
    local.tee $y_dist ;; サンプルコードだとこの下に空行。いらなくない？
    local.get $y_dist
    f64.mul

    f64.add  ;; 足して、
    f64.sqrt ;; 平方根。
  )
)
