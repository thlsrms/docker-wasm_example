## To run this project

 ### 1. Compile the app into a Wasm binary:
**`cargo build --target wasm32-wasi --release`**
<sub>Execute: `rustup target add wasm32-wasi` to add the wasm32-wasi compilation target.</sub>

### 2. Build this wasm app into an OCI image:
Right now to enable the platform **`wasi/wasm`**, the following option must be enabled on Docker Desktop:
***Use containerd for pulling and storing images*** under *Settings* -> *Features in development*

Run the command:
**`docker buildx build --platform wasi/wasm -t docker-wasm:0.1 .`**
<sup>The **buildx** command can be omitted, or you might want to follow the instructions at [docker/buildx](https://github.com/docker/buildx) to install it.</sup>
This command will use the Dockerfile in the root of the project to build the image.
The `--platform wasi/wasm` flag sets the target OS for the image to `wasi` and target architecture to `wasm`.
The `-t docker-wasm:0.1` tags/names the image "docker-wasm:0.1".

### 3. Run the wasm app using Docker
**`docker container run --rm --name=dockerwasm --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm docker-wasm:0.1`**

The `--runtime=io.containerd.wasmedge.v1` flag is how Docker tells [containerd](https://containerd.io/) to use the [runwasi containerd shim](https://github.com/containerd/runwasi) that uses [WasmEdge](https://wasmedge.org/) to run the Wasm module packaged in the image.

---
<sup>More can be read at: [Introducing the Docker+Wasm Technical Preview](https://www.docker.com/blog/docker-wasm-technical-preview/)</sup>
