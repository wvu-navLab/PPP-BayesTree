# PPP-BayesTree

This repository contains a modified version of [GTSAM](https://bitbucket.org/gtborg/gtsam), which has been modified for GNSS data processing. A detailed description of the modification made can be found in "Evaluation of Precise Point Positioning Convergence with an Incremental Graph Optimizer". This software has been cleared for public release by the USAF Case # PENDING


## How to Install


### 1) Requirements/Recommendations

#### Required
* Boost -->  ```` sudo apt-get install libboost-all-dev ````
* CMake -->  ```` sudo apt-get install cmake ````

#### Recommended
* Intel TBB -->  ```` sudo apt-get install libtbb-dev ````
* [Intel MKL](https://software.intel.com/en-us/mkl)



### 2) Clone repository to local machine  
* PPP-BayesTree --> ```` git clone https://github.com/wvu-navLab/PPP-BayesTree.git  ````


### 3) Build

````bash

cd PPP-BayesTree/truck/gtsam;
mkdir build;  
cd build;
cmake ..
make

````

### 4) Test

**ADD MORE HERE LATER**

````bash
./examples/pppBayesTree -c example.conf
````
