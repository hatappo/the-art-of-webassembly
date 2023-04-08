const fs = require('fs');
const basename = __filename.split(/[./]/).reverse()[1];
const bytes = fs.readFileSync(`${__dirname}/${basename}.wasm`);

const value = parseInt(process.argv[2]);


(async () => {
  let obj = await WebAssembly.instantiate(
    new Uint8Array(bytes));

  if (!!obj.instance.exports.is_prime(value)) {   // 返り値が Int なので !! で Boolean に変換
    console.log(`
      ${value} is prime!
    `)
  } else {
    console.log(`
      ${value} is NOT prime
    `)
  }
})();




/* 実行結果例
$ node is_prime.js 0

      0 is NOT prime
    
$ node is_prime.js 1 

      1 is NOT prime
    
$ node is_prime.js 2

      2 is prime!
    
$ node is_prime.js 3

    3 is prime!

$ node is_prime.js

    NaN is NOT prime

$ node is_prime.js 2003

    2003 is prime!
*/
