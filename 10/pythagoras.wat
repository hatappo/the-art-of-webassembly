(module
  (import "js" "log_f64" (func $log_f64(param i32 f64)))

  (func $distance (export "distance")
    (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64)
    (result f64)
    (local $x_dist f64)
    (local $y_dist f64)
    (local $temp_f64 f64) ;; ロギングする値を一時的に入れるための変数

    local.get $x1
    local.get $x2
    f64.sub

    local.tee $x_dist

    (call $log_f64 (i32.const 1) (local.get $x_dist)) ;; ロギングその１

    local.get $x_dist
    f64.mul

    local.tee $temp_f64 ;; この次の行でロギングするために $temp_f64 にスタックの先頭の値をコピー。この後この書き方が何度も登場する。
    (call $log_f64 (i32.const 2) (local.get $temp_f64)) ;; ロギングその２

    local.get $y1
    local.get $y2
    f64.add           ;; バグの箇所
    local.tee $y_dist

    (call $log_f64 (i32.const 3) (local.get $y_dist)) ;; ロギングその３

    local.get $y_dist
    f64.mul

    local.tee $temp_f64
    (call $log_f64 (i32.const 4) (local.get $temp_f64)) ;; ロギングその４

    f64.add

    local.tee $temp_f64
    (call $log_f64 (i32.const 5) (local.get $temp_f64)) ;; ロギングその５

    f64.sqrt

    local.tee $temp_f64
    (call $log_f64 (i32.const 6) (local.get $temp_f64)) ;; ロギングその６
  )
)
