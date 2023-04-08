(module

  ;; 渡された値偶数かどうかを判定する関数
  (func $even_check (param $n i32) (result i32)
    local.get $n
    i32.const 2
    i32.rem_u           ;; remainder （剰余） _ unsigned （符号なし） の演算。直前にスタックに積まれた $n と 2 をポップして使用する。
    i32.const 0         ;; 剰余の結果を比較するための値。剰余が 0 であれば偶数。
    i32.eq              ;; ＄n % 2 == 0 。真なら 1 が、偽なら 0 が返る。
  )

  ;; 渡された値が２かどうかを判定する関数
  (func $eq_2 (param $n i32) (result i32)
    local.get $n
    i32.const 2
    i32.eq              ;; $n == 2 。真なら 1 が、偽なら 0 が返る。
  )

  ;; 第一引数 $n が第二引数 $m の倍数かどうかを判定する関数
  (func $multiple_check (param $n i32) (param $m i32) (result i32)
    local.get $n
    local.get $m
    i32.rem_u           ;; $n / $m の余りを計算しスタックに積む
    i32.const 0         ;; 剰余の値を比較するための値。剰余が 0 であれば $n は $m の倍数だといえる。
    i32.eq              ;; $n % $m == 0 の判定。
  )

  ;; 渡された値が素数かどうかを判定する関数
  (func $is_prime (export "is_prime") (param $n i32) (result i32)
    (local $i i32)      ;; ループカウンタ。 初期値を与えていないので 0 で初期化される。

    ;; $n が 1 かどうか調べる
    (if (i32.eq (local.get $n) (i32.const 1))
      (then             ;; 引数  $n が 1 なので素数ではない。
        i32.const 0     ;; そのため、偽を表す 0 を積んで return する。
        return
      )
    )

    ;; $n が 2 かどうか調べる
    (if (call $eq_2 (local.get $n))
      (then             ;; 引数  $n が 2 なので素数である（2 は偶数だけど素数）。
        i32.const 1     ;; そのため、真を表す 1 を積んで return する。
        return          
      )
    )

    (block $not_prime
      (call  $even_check (local.get $n))
      br_if $not_prime

      (local.set $i (i32.const 1))

      (loop $prime_test_loop
        
        (local.tee $i                               ;; tee はスタックの先頭の値を取得するが消さずに残す。
          (i32.add (local.get $i) (i32.const 2)))   ;; $i += 2 。スタックの状態: [$i]
        
        local.get $n                                ;; スタックの状態: [$n, $i]

        i32.ge_u                                    ;; $i >= $n
        if
          i32.const 1
          return
        end

        (call $multiple_check (local.get $n) (local.get $i))

        br_if $not_prime
        br $prime_test_loop
      ) ;; loop $prime_test_loop の終わり
    ) ;; block $not_prime の終わり
    i32.const 0
  )
) ;; module の終わり
