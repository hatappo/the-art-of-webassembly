const fs = require("fs");
const loader = require("@assemblyscript/loader");

(async () => {
  let module = await loader.instantiate(fs.readFileSync("as_concat.wasm"));
  // newString 関数と getString 関数を呼び出すには --exportRuntime フラグを使ってコンパイルする必要がある
  let fst_str_index = module.exports.__newString("first string");
  let snd_str_index = module.exports.__newString("second string");
  let cat_str_index = module.exports.cat(fst_str_index, snd_str_index);
  let cat_string = module.exports.__getString(cat_str_index);
  console.log(cat_string);
})();
