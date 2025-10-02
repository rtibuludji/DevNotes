
curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

perl ./install-tl --no-interaction -no-gui text -texdir ~/.local/textlive/2025
perl ./install-tl --no-interaction -no-gui -texdir ~/.local/textlive/2025

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_MULTIPRECISION=ON -DWITH_MULTIPARTY=ON


mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_MULTIPRECISION=ON -DWITH_MULTIPARTY=ON -DCMAKE_INSTALL_PREFIX=/home/rtibuludji/.local -DBUILD_UNITTESTS=OFF -DBUILD_BENCHMARKS=OFF
make
ls
make install

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/rtibuludji/.local/lib
echo $LD_LIBRARY_PATH


cuda --version
nvcc --version
uv add torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

uv venv --python=python3.13
source .venv/bin/activate
pip3 --version
pip --version
ls
uv pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
uv pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128