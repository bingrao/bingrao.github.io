---

title: Deploying DeepLearnig development environment on Ubuntu 16.04

layout: post

categories: [System]

sub_class: DeepLearnig

tags: [DeepLearning, gpu, cuda, GTX1080, theano, TensorFlow]

keywords: DeepLearning, gpu, cuda, GTX1080, theano, TensorFlow

desc: Introducing how to deploy a development environment for DeepLearning based on GTX 1080 and Ubuntun 16.04.

date: 2017-07-20

author: Bing

---

System Requirements
===================

The GPU-enabled version of TensorFlow and Theano has the following requirements:

-	Ubuntu 16.04
-	GTX 1080
-	Python 2.7
-	CUDA 8.0
-	cuDNN v5.1
-	TensorFlow v1.2
-	Theano v0.9
-	gpuarray v0.6

Pre-deploy
==========

-	Update system

	```
	sudo apt-get update && sudo apt-get -y upgrade
	```

-	Install essential build tools for system

	```
	sudo apt-get install -y build-essential &&\
	sudo apt-get install -y git &&\
	sudo apt-get install -y python-pip &&\
	sudo apt-get install -y python-matplotlib &&\
	sudo apt-get install -y python-dev &&\
	sudo apt-get install -y python-pydot &&\
	sudo apt-get install -y python-numpy &&\
	sudo apt-get install -y python-sklearn &&\
	sudo apt-get install -y python-pandas &&\
	sudo apt-get install -y libfreetype6-dev &&\
	sudo apt-get install -y libxft-dev &&\
	sudo apt-get install -y libncurses-dev &&\
	sudo apt-get install -y libopenblas-dev &&\
	sudo apt-get install -y gfortran &&\
	sudo apt-get install -y libblas-dev &&\
	sudo apt-get install -y liblapack-dev &&\
	sudo apt-get install -y libatlas-base-dev &&\
	sudo apt-get install -y unzip zip &&\
	sudo apt-get install -y swig python-pandas &&\
	sudo apt-get install -y wget &&\
	sudo apt-get install -y pkg-config &&\
	sudo apt-get install -y zlib1g-dev
	```

Install CUDA 8.0 for GTX 1080
=============================

-	Verify You Have a CUDA-Capable GPU

	```
	lspci | grep -i nvidia
	```

	If you do not see any settings, update the PCI hardware database that Linux maintains by entering update-pciids (generally found in /sbin) at the command line and rerun the previous lspci command.

-	Verify the System has the Correct Kernel Headers and Development Packages Installed

	The CUDA Driver requires that the kernel headers and development packages for the running version of the kernel be installed at the time of the driver installation, as well whenever the driver is rebuilt

	```
	sudo apt-get install linux-headers-$(uname -r)
	```

-	Download the NVIDIA CUDA Toolkit

	The NVIDIA CUDA Toolkit is available at [<span style="color:red">**NVIDIA Download**</span>](http://developer.nvidia.com/cuda-downloads)\.

	![Download CUDA8.0](/static/data/blog/system/download_cuda8.0.png)

	Choose the platform you are using and download the NVIDIA CUDA Toolkit. The CUDA Toolkit contains the CUDA driver and tools needed to create, build and run a CUDA application as well as libraries, header files, CUDA samples source code, and other resources.

-	Install CUDA

	```
	sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
	sudo apt-get update
	sudo apt-get install cuda
	```

-	Configure environment path

	-	system library (as admin)

		Append the following contents to the "/etc/profile"

		```
		export CUDA_HOME=/usr/local/cuda
		export CUDA_ROOT=/usr/local/cuda
		export PATH=${CUDA_HOME}/bin:$PATH
		export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
		```

		Make change effect and Verify it.

		```
		source /etc/profile
		echo ${CUDA_HOME}
		```

	-	user library

		Append the following contents to the "~/.bashrc"

		```
		export CUDA_HOME=/usr/local/cuda
		export CUDA_ROOT=/usr/local/cuda
		export PATH=${CUDA_HOME}/bin:$PATH
		export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
		```

		Make change effect and Verify it.

		```
		source ~/.bashrc
		echo ${CUDA_HOME}
		```

-	Verify a Successful Installation

	```
	cd ${CUDA_HOME}/samples/1_Utilities/deviceQuery
	sudo make
	./deviceQuery
	```

Install cuDNN v5.1
==================

Once the CUDA Toolkit is installed, download [<span style="color:red">**cuDNN v5.1 Library**</span>](https://developer.nvidia.com/rdp/cudnn-download#a-collapseTwo) for Linux and install by following the official documentation.

Once downloaded, navigate to the directory containing cuDNN then execute following command:

```
tar xf cudnn-8.0-linux-x64-v5.1.tgz -C /usr/local
```

Install TensorFlow v1.2
=======================

-	Prepare TensorFlow Dependencies and Required Packages

	```
	sudo apt-get install libcupti-dev
	```

-	Install TensorFlow (GPU-accelerated version)

	```
	sudo pip  install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.2.1-cp27-none-linux_x86_64.whl
	```

-	Verify a Successful Installation

	Invoke python: type python in command line

	```
	python
	```

	Input the following short program:

	```
	import tensorflow as tf
	hello = tf.constant('Hello, TensorFlow!')
	sess = tf.Session()
	print(sess.run(hello))
	```

Install theano
==============

-	Please refer to Theano [<span style="color:red">**install Documents**</span>](http://deeplearning.net/software/theano/install_ubuntu.html) to satisfy the requirements.

-	Install the latest stable version of Theano with:

	```
	sudo pip install Theano[test, doc]
	```

Install gpuarray
================

-	Please double check Build ad Run Requirements based on [<span style="color:red">**Installation Document**</span>](http://deeplearning.net/software/libgpuarray/installation.html#step-by-step-install)

-	Download source code.

	```
	git clone https://github.com/Theano/libgpuarray.git
	cd libgpuarray
	```

-	Step-by-step install: system library (as admin)

	-	For libgpuarray:

		```
		mkdir Build
		cd Build
		cmake .. -DCMAKE_BUILD_TYPE=Release
		make
		make install
		cd ..
		```

	-	For pygpu:

		```
		# This must be done after libgpuarray is installed as per instructions above.
		python setup.py build
		python setup.py install
		```

Reference
=========

1.	[<span style="color:blue">TensorFlow Installation from NVIDA Document</span>](http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html)
2.	[<span style="color:blue">Installing TensorFlow on Ubuntu</span>](https://www.tensorflow.org/install/install_linux#the_url_of_the_tensorflow_python_package)
3.	[<span style="color:blue">Installation gpuarray</span>](http://deeplearning.net/software/libgpuarray/installation.html#step-by-step-install)
4.	[<span style="color:blue">Installation theano</span>](http://deeplearning.net/software/theano/install_ubuntu.html)
5.	[<span style="color:blue">NVIDIA CUDA Installation Guide for Linux</span>](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#axzz4nOZO7Ie5)
6.	[<span style="color:blue">Installation gpuarray</span>](http://deeplearning.net/software/libgpuarray/installation.html#step-by-step-install)
7.	[<span style="color:blue">TensorFlow — Getting started, GPU installation on EC2</span>](https://medium.com/@giltamari/tensorflow-getting-started-gpu-installation-on-ec2-9b9915d95d6f)
