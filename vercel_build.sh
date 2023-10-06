echo "Installing Rustup..."
# Install Rustup (compiler)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Adding binaries to path
source "$HOME/.cargo/env"


echo "Installing wasm-pack..."
# Install wasm-pack
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh -s -- -y


echo "Building wasm-parser..."
# Build wasm from rust 
npm run build:wasm

# Handle linking of cadmium package
cd src/rust/cadmium/pkg
npm link
cd ../../../..
npm link cadmium

echo "Build static frontend client..."
# Build static html for the react client
npm run build