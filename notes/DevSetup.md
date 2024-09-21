
### 0. Install GCC 

### 1. Create Development Tools directory
```bash
sudo mkdir ~/.dev
export HOMEDEV=~/.dev
```

export PATH
```bash
export PATH=$PATH:$HOMEDEV/bin
```

### 2. Install CMAKE Build Tools

Download the source code
```bash
cd /tmp
curl -L -O https://github.com/Kitware/CMake/releases/download/v3.30.3/cmake-3.30.3.tar.gz
```

extract the source code
```bash
tar xzvf cmake-3.30.3.tar.gz
cd cmake-3.30.3
```

compile and install
```bash
./bootstrap --prefix=$HOMEDEV -- -DCMAKE_USE_OPENSSL=OFF
make
sudo make install
```

### 3. Install Ninja

Download the source code
```bash
curl -L -O https://github.com/ninja-build/ninja/archive/refs/tags/v1.12.1.tar.gz
```
extract the source code
```bash
tar xzvf v1.12.1.tar.gz
cd ninja-1.12.1
```
compile
```bash
cmake -Bbuild-cmake -H.
cmake --build build-cmake
```
test and install
```bash
./build-cmake/ninja_test
sudo cp ./build-cmake/ninja $HOMEDEV/bin
```

### 3. Install CppCheck (Optional)

Download the source code


### 4. Install CLANG 

Clone the LLVM-Project
```bash
git clone https://github.com/llvm/llvm-project.git
```

Build and Install CLANG and CLANG-TOOLS EXTRA
```bash
cmake -S llvm -B build -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -DCMAKE_INSTALL_PREFIX=$HOMEDEV
cmake --build build
cmake --install build
```