const fs = require('fs');
const buf = fs.readFileSync('out/main.wasm');

// const start = async function () {
//     const lib = await WebAssembly.instantiate(new Uint8Array(buf), { x: { y: function (arg) { console.log(arg); } } }).then(res => res.instance);
// }
// start();

(async()=>{await WebAssembly.instantiate(new Uint8Array(buf),{"x":{"y":function (arg){console.log(arg);}}});})();