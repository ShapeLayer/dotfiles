tar xvf [cudnn-archive].tar.xz

sudo cp cudnn-*-archive/include/cudnn*.h /usr/local/cuda/include
sudo cp -P cudnn-*-archive/lib/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

ls ~/.bashrc.env 2> /dev/null || (echo "source ~/.bashrc.env" >> ~/.bashrc)
echo "# NVIDIA CUDA Toolkit" >> ~/.bashrc.env
echo "export PATH=/usr/local/cuda-11.7/bin:$PATH" >> ~/.bashrc.env
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64/" >> ~/.bashrc.env
