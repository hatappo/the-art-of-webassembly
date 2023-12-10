const fs = require("fs");
const bytes = fs.readFileSync(__dirname + "/as_hello.wasm");

// メモリオブジェクトは AssemblyScript からエクスポートされる
var memory = null;

let importObject = {
  // モジュールのファイル名から拡張子を省いたものを外側のオブジェクトの名前として使う
  as_hello: {
    // AssemblyScript は文字列（長さを表すプレフィックスを持つ）を単純なインデックスで渡す
    console_log: function (index) {
      // memory が設定される前に呼び出された場合
      if (memory == null) {
        console.log("memory buffer is null");
        return;
      }

      const len_index = index - 4;

      // バイトを16ビット Unicode 文字に変換するには２で割らなければならない
      const len = new Uint32Array(memory.buffer, len_index, 4)[0];

      const str_bytes = new Uint16Array(memory.buffer, index, len);

      // UTF-16 バイト配列を JavaScript 文字列としてデコード
      const log_string = new TextDecoder("utf-16").decode(str_bytes);
      console.log(log_string);
    },
  },
  env: {
    abort: () => {},
  },
};

async () => {
  let obj = await WebAssembly.instantiate(new Uint8Array(bytes), importObject);
  // AssemblyScript からエクスポートされたメモリオブジェクト
  memory = obj.instance.exports.memory;
  // HelloWorld 関数を呼び出す
  obj.instance.exports.HelloWorld();
};
