
入門 WebAssembly https://www.shoeisha.co.jp/book/detail/9784798173597
（正誤表もあり）





# Chapter 2



[JavaScriptの数値型完全理解 - Qiita](https://qiita.com/uhyo/items/f9abb94bcc0374d7ed23)
Javascript の数値型は、すべて 64 ビットの浮動小数点数で表現されている。
整数と小数が区別されているようで、されていない。










# Chapter 1

## コンパイル環境

```
$ node -v
v19.8.1

$ npm -v
9.5.1


npm install -g wat-wasm


$ wat2wasm  

    Usage:
    wat2wasm file.wat
    Creates file.wasm given a WebAssembly Text file
  
    wat2wasm file.wat -o other.wasm
    Creates other.wasm WebAssembly file from file.wat.
      The -o flag allows you to specify an output file.
  
    Flags:
    -o is followed by an output file name);

    -O1 minimal performance optmization
    -O2 moderate performance optmization
    -O3 maximum performance optmization

    -Os minimal size optmization
    -Oz maximum size optmization

    --exceptions exception handling (proposal)
    --mutable-globals import/export mutable globals (proposal)
    --sat-float-to-int non-trapping float-to-int conversion (proposal)
    --sign-extension sign-extension operators (proposal)
    --sign-extension sign-extension operators (proposal)
    --simd single instruction multiple data (proposal)
    --threads threads (proposal)
    --multi-value functions may return more than one value (proposal)
    --tail-call tail call optimization (proposal)
    --bulk-memory bulk memory copy and memory move (proposal)
    --reference-types improved interoperablility with host env (proposal)
    --annotations custom annotations (proposal)
    --gc garbage collection (proposal)
```

実行例

```sh
$ wat2wasm AddInt.wat 

========================================================
  WAT2WASM
========================================================
  

  Need help?  
  Contact Rick Battagline
  Twitter: @battagline
  https://wasmbook.com
  v1.0.43
  
no memory
Writing to AddInt.wasm
WASM File Saved!

$ node AddInt.js 4 7
4 + 7 = 11

$ node AddInt.js 100 23
100 + 23 = 123

```


## エディタ環境

https://marketplace.visualstudio.com/items?itemName=dtsvet.vscode-wasm

> - Syntax highlight
> - Preview WebAssembly Binary files in 2 clicks.
> - Fast convertion between text and binary view.
> - Syntax highlight for WAI and WIT files.

ミスっている箇所を赤字で強調してくれるので分かりやすい。

![](img/codesnap_typo_error_with_red_color.png)


## 最新の Instructions Set

たぶん v2.0 draft

https://webassembly.github.io/spec/core/appendix/index-instructions.html

