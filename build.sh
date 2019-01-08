#!/bin/bash
 echo "#################Install Enviorment######################"
 echo "First Install Mesos Enviorment"
 sudo apt-get install -y tar wget git
 sudo apt-get install -y autoconf libtool
 sudo apt-get install -y openjdk-8-jdk
 sudo apt-get -y install build-essential python-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping

 echo "Second,Install Boost Enviorment"
 sudo apt install mpi-default-dev　　 
 sudo apt install libicu-dev　　　　   
 sudo apt install python-dev　　　　   
 sudo apt install libbz2-dev　

 echo "Third,Install other Enviorment"
 sudo apt-get -y install dmidecode lshw hdparm cpuid 
 sudo apt install python-pip
 sudo apt install valgrind

 echo "ENVIORMENT INSTALL FINISH"

 echo "#################Install gtest,glog,gflags,protobuf,boost,mesos,cmake########################"
 
 echo "####################1.1 Install Cmake-3.13.2############################"
 if [ ! -f "cmake-3.13.2.tar.gz" ]; then
     wget https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2.tar.gz
     tar -xzvf cmake-3.13.2.tar.gz
     cd cmake-3.13.2
     ./configure --prefix=/usr/local
     sudo make -j 2
     sudo make install
     cd ..
 fi

 echo "####################1.2 Install Gtest-1.8.1##########################"
 if [ ! -f "release-1.8.1.tar.gz" ]; then
     wget https://github.com/google/googletest/archive/release-1.8.1.tar.gz
     tar -xzvf release-1.8.1.tar.gz
     cd googletest-release-1.8.1
     cmake .
     sudo make -j 2
     sudo make install -j 2
     cd ..
 fi

 echo "####################1.3 Install Glog-0.3.3###########################"
 if [ ! -f "v0.3.3.tar.gz" ]; then
     echo "1.2 Install Glog-0.3.3"
     wget https://github.com/google/glog/archive/v0.3.3.tar.gz
     tar -xzvf v0.3.3.tar.gz
     cd glog-0.3.3
     ./configure 
     sudo make -j 2
     sudo make install -j 2
     cd ..
 fi
 
 echo "####################1.4 Install Gflags-2.2.2#########################"
 if [ ! -f "v2.2.2.tar.gz" ]; then
     wget https://github.com/gflags/gflags/archive/v2.2.2.tar.gz
     tar -xzvf v2.2.2.tar.gz
     cd gflags-2.2.2
     cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=ON
     sudo make -j 2
     sudo make install -j 2
     cd ..
 fi
 
 echo "####################1.4 Install Protobuf-2.6.1#######################"
 if [ ! -f "protobuf-2.6.1.tar.gz" ]; then
     wget https://github.com/protocolbuffers/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.gz
     tar -xzvf protobuf-2.6.1.tar.gz
     cd protobuf-2.6.1
     ./autogen.sh
     ./configure --prefix=/usr/local
     sudo make -j 2
     sudo make install -j 2
     export LD_LIBRARY_PATH=/usr/local/lib
     cd ..
 fi

 echo "#####################1.5 Install Boost-1.69.0#########################"

 if [ ! -f "boost-1.69.0.tar.gz" ]; then
     wget https://github.com/boostorg/build/archive/boost-1.69.0.tar.gz
     tar -xzvf boost-1.69.0.tar.gz
     cd build-boost-1.69.0
     ./bootstrap.sh
     sudo ./b2 install --prefix=/usr/local
     cd ..
 fi

 if [ ! -f "v2.12.8.tar.gz" ]; then
     wget https://github.com/scala/scala/archive/v2.12.8.tar.gz
     tar -xzvf v2.12.8.tar.gz
     sudo mv scala-2.12.8/ /usr/local/share/scala
 fi

 if [ ! -f "1.8.0_191.tar.gz"]; then 
     wget https://github.com/weiguow/jdk1.8.0_191/archive/1.8.0_191.tar.gz
     tar -xzvf 1.8.0_191.tar.gz
     sudo mv jdk1.8.0_191 /usr/local
 fi
     
# echo "1.6 Install Mesos-1.3.2"
 #if [ ! -f "1.3.2.tar.gz" ]; then
  #   wget https://github.com/apache/mesos/archive/1.3.2.tar.gz
   #  tar -xzvf 1.3.2.tar.gz
    # cd mesos-1.3.2
     #./bootstrap
     #mkdir build
     #cd build
     #../configure --prefix=/home/weiguow/test/mesos
     #sudo make 
     #sudo make install 
     #cd ../..
 #fi

 echo "FINISH ALL" 
