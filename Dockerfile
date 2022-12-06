FROM scratch
COPY ./target/wasm32-wasi/release/hello-docker.wasm /hello-docker.wasm
ENTRYPOINT [ "hello-docker.wasm" ]
