
### 0. Prerequisted 
- Should already install GCC and GNU Development Tools




### 1. Create Development Tools directory
```bash
sudo mkdir -p ~/.local
export HOMEDEV=~/.local
```

export PATH
```bash
export PATH=$PATH:$HOMEDEV/bin
```

### 2. Install OpenSSL Dev
- OpenSSL dev
Download the source code
```bash
cd /tmp 
curl -L -O https://github.com/openssl/openssl/archive/refs/tags/openssl-3.3.2.tar.gz
```
extract the source code
```bash
tar xzvf openssl-3.3.2.tar.gz
cd openssl-3.3.2
```

### 3. Install CMAKE Build Tools
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
./bootstrap --prefix=${HOMEDEV}
make
make install
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
sudo cp ./build-cmake/ninja ${HOMEDEV}/bin
```

### 3. Install vcpkg
```bash
cd ${HOMEDEV}
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh --disableMetrics
```

### 4. Install CppCheck (Optional)
Clone CppCheck
```bash
git clone https://github.com/danmar/cppcheck.git
```
Build and Install CPPCHEK
```bash
cd cppcheck
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOMEDEV
cmake --build .
cmake --install .
```
Copy CFG to share
```bash
mkdir $HOMEDEV/share/Cppcheck
cp -R $HOMEDEV/OFF/cfg $HOMEDEV/share/Cppcheck/cfg
```

### 5. Install LLVM + CLANG (Optional)
Clone the LLVM-Project
```bash
git clone https://github.com/llvm/llvm-project.git
```
Build and Install CLANG and CLANG-TOOLS EXTRA
```bash
cmake -S llvm -B build -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -DCMAKE_INSTALL_PREFIX=$HOMEDEV/clang
cmake --build build
cmake --install build
```
