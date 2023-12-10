(module
  (func $distance (;0;) (export "distance") (param $var0 f64) (param $var1 f64) (param $var2 f64) (param $var3 f64) (result f64)
    (local $var4 f64)
    (local $var5 f64)
    local.get $var0
    local.get $var2
    f64.sub
    local.tee $var4
    local.get $var4
    f64.mul
    local.get $var1
    local.get $var3
    f64.add
    local.tee $var5
    local.get $var5
    f64.mul
    f64.add
    f64.sqrt
  )
)