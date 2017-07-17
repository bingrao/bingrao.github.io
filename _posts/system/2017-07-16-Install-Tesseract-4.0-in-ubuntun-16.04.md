---

title: Install Tesseract 4.0 in Ubuntu 16.04

layout: post

categories: [System]

sub_class: ocr

tags: [Tesseract, OCR, Ubuntu]

keywords: Tesseract 4.0, OCR, Ubuntu 16.04

desc: A tutorial about how to install Tesseract 4.0 from source code in Ubuntu 16.04

date: 2017-07-16

author: Bing

---

This post expects you to be familiar with compiling software on your Ubuntu operation system.

**Configure compiling environment**
===================================

```
sudo apt-get install -y build-essential &&\
sudo apt-get install -y python-dev &&\
sudo apt-get install -y python &&\
sudo apt-get install -y python-pip &&\
sudo apt-get install -y python-setuptools &&\
sudo pip install -y cython
```

**Upgrade g++5**
================

```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test &&\
sudo apt-get update &&\
sudo apt-get upgrade &&\
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5
```

**Install dependency package**
==============================

```
sudo apt-get install -y autoconf automake libtool &&\
sudo apt-get install -y autoconf-archive &&\
sudo apt-get install -y pkg-config &&\
sudo apt-get install -y libpng12-dev &&\
sudo apt-get install -y libjpeg8-dev &&\
sudo apt-get install -y libtiff5-dev &&\
sudo apt-get install -y zlib1g-dev &&\
sudo apt-get install -y libicu-dev &&\
sudo apt-get install -y libpango1.0-dev &&\
sudo apt-get install -y libcairo2-dev
```

**Install Leptonica 1.74**
==========================

Install it from source code
---------------------------

1.	Download the source code from [Leptonica](http://www.leptonica.org/download.html)

2.	Following the instructions to install it.

	```
	sudo tar xf leptonica-1.74.tar.gz &&\
	cd leptonica-1.74 &&\
	sudo ./configure &&\
	sudo make &&\
	sudo make install
	```

**Install it from Unofficial Ubuntu PPAs**
------------------------------------------

```
sudo add-apt-repository ppa:alex-p/tesseract-ocr &&\
sudo apt-get update &&\
sudo apt-get install -y libleptonica-dev &&\
sudo ldconfig
```

**Install Tesseract 4.0**
=========================

1.	Checkout code from [Github](https://github.com/tesseract-ocr/tesseract)

2.	Compiling it and install it.

	```
	sudo sh autogen.sh  &&\
	./configure  &&\
	LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make  &&\
	sudo make install  &&\
	sudo make install -langs  &&\
	sudo ldconfig
	```
