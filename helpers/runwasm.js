const fs = require('fs');
const buf = fs.readFileSync('out/main.wasm');

const start = async function () {
    const lib = await WebAssembly.instantiate(new Uint8Array(buf)).
        then(res => res.instance.exports);
    console.log(lib.a());
}
start();