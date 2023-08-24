#!/bin/bash

# Extract and install TCL
tar xvf tcl8.4.20-src.tar.gz
cd tcl8.4.20/unix
./configure --prefix=/usr/tcl --enable-shared
make
make install
cp tclUnixPort.h ../generic/
cd ../../

# Extract and install Expect
tar xzvf expect5.45.tar.gz
cd expect5.45
./configure --prefix=/usr/expect --with-tcl=/usr/tcl/lib --with-tclinclude=../tcl8.4.20/generic
make
make install

# Create a symbolic link for the 'expect' command
ln -s $(pwd)/expect /usr/bin/expect



