#!/bin/sh
rustup target add wasm32-unknown-unknown

cd fdg-macroquad && cargo build --release --target wasm32-unknown-unknown --examples && cd ..

cp target/wasm32-unknown-unknown/release/examples/view_nd_cube.wasm ./fdg-macroquad/examples/web-examples/
cp target/wasm32-unknown-unknown/release/examples/view_binary_tree.wasm ./fdg-macroquad/examples/web-examples/
cp target/wasm32-unknown-unknown/release/examples/view_cylinder.wasm ./fdg-macroquad/examples/web-examples/
cp target/wasm32-unknown-unknown/release/examples/view_json.wasm ./fdg-macroquad/examples/web-examples/
cp target/wasm32-unknown-unknown/release/examples/view_lattice.wasm ./fdg-macroquad/examples/web-examples/
cp target/wasm32-unknown-unknown/release/examples/view_ring.wasm ./fdg-macroquad/examples/web-examples/
cp target/wasm32-unknown-unknown/release/examples/view_sphere.wasm ./fdg-macroquad/examples/web-examples/
cp target/wasm32-unknown-unknown/release/examples/view_social_network.wasm ./fdg-macroquad/examples/web-examples/

cd fdg-wasm && make && cd ..

mkdir -p ./fdg-macroquad/examples/web-examples/wasmapi/
cp fdg-wasm/examples/* ./fdg-macroquad/examples/web-examples/wasmapi/
cp -rvf fdg-wasm/pkg/ ./fdg-macroquad/examples/web-examples/
rm -rvf ./fdg-macroquad/examples/web-examples/.gitignore
rm -rvf ./fdg-macroquad/examples/web-examples/pkg/.gitignore