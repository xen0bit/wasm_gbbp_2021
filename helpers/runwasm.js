const fs = require('fs');
const buf = fs.readFileSync('out/main.wasm');

const start = async function () {
    const lib = await WebAssembly.instantiate(new Uint8Array(buf), { console: { log: function (arg) { console.log(arg); } } }).then(res => res.instance);
}
start();