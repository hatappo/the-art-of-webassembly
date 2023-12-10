(module
  (func $distance (export "distance")
    (param $x1 f64) (param $y1 f64) (param $x2 f64) (param $y2 f64)
    (result f64)
    (local $x_dist f64)
    (local $y_dist f64)

    local.get $x1
    local.get $x2
    f64.sub

    local.tee $x_dist

    local.get $x_dist
    f64.mul

    local.get $y1
    local.get $y2
    f64.add           ;; バグの箇所
    local.tee $y_dist

    local.get $y_dist
    f64.mul

    f64.add

    f64.sqrt
  )
)
