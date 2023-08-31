### Rocky Linux 8 Development Setup

#### 0. Update Packages

Update the packages
```bash
sudo dnf update -y
```

### 1. Install Development Tools
Install GCC and other development Tools
```bash
sudo dnf group install "Development Tools"
```
### 2. Install Python 3.9
```bash
sudo dnf install python39
```

### 3. Create Development Tools directory
```bash
sudo mkdir /opt/rtibuludji-dev/
```

export PATH
```bash
export PATH=$PATH:/opt/rtibuludji-dev/bin
```

### 4. Install CMAKE Build Tools

Download the source code
```bash
cd /tmp
curl -L -O https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5.tar.gz
```

extract the source code
```bash
tar xzvf cmake-3.20.5.tar.gz
cd cmake-3.20.5
```

compile and install
```bash
./bootstrap --prefix=/opt/rtibuludji-dev -- -DCMAKE_USE_OPENSSL=OFF
make
sudo make install
```

### 5. Install Ninja Build Tools

Download the source code
```bash
curl -L -O https://github.com/ninja-build/ninja/archive/refs/tags/v1.10.2.tar.gz
```

extract the source code
```bash
tar xzvf v1.10.2.tar.gz
cd ninja-1.10.2
```
compile
```bash
cmake -Bbuild-cmake -H.
cmake --build build-cmake
```

test and install
```bash
./build-cmake/ninja_test
sudo cp ./build-cmake/ninja /opt/rtibuludji-dev/bin
