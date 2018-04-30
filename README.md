# PPP-BayesTree

This repository contains a modified version of [GTSAM](https://bitbucket.org/gtborg/gtsam), which has been updated for GNSS data processing. To enable RINEX file reading and GNSS observation modeling, the [GPSTk](http://www.gpstk.org/bin/view/Documentation/WebHome) library is utilized. A detailed description of the modification made can be found in ["Evaluation of Kinematic Precise Point Positioning Convergence with an Incremental Graph Optimizer"](https://www.researchgate.net/publication/324454778_Evaluation_of_Kinematic_Precise_Point_Positioning_Convergence_with_an_Incremental_Graph_Optimizer). This software has been cleared for public release by the USAF Case # 88ABW-2018-0905


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
mkdir build && cd build;
cmake ..
make

````

### 4) Test

As an example, a sample data-set is provided. This data-set was collected at West Virginia University on-board a small, fixed-wing UAV --- this platform is known as the [Phastball](https://www.researchgate.net/publication/312112578_Characterization_of_Multi-Antenna_GNSS_Multi-Sensor_Attitude_Determination_for_Stratospheric_Balloon_Platforms/figures?lo=1&utm_source=google&utm_medium=organic). The two images below, we provide an in-flight image from the Phastball, and the flight profile. 

![phastball](https://photos.google.com/share/AF1QipMwM6IhV19NufTuGzPxqgvcv6tmG8giXcoMKTbhxwsTe9bE-qVJ5v7t_NKvgWj3AA/photo/AF1QipOIGplMBxzrgOoJ39kz6ZVpmMskxkupN4GF8Toi?key=VGVnLWJVOFFrT0M0OG9aZ3BGbmVZd3c4eW1Wc2F3)

![profile](https://photos.google.com/share/AF1QipMwM6IhV19NufTuGzPxqgvcv6tmG8giXcoMKTbhxwsTe9bE-qVJ5v7t_NKvgWj3AA/photo/AF1QipP0Yu0PLKk2otQ_Yuqtur4eBJKN0wfpP_rDZnmX?key=VGVnLWJVOFFrT0M0OG9aZ3BGbmVZd3c4eW1Wc2F3)

Using the provided data-set, the PPP Bayes tree example can be utilized as shown below.

````bash
cd ../data
./../build/examples/pppBayesTree -c phastball.conf
````

![error](https://photos.google.com/share/AF1QipMwM6IhV19NufTuGzPxqgvcv6tmG8giXcoMKTbhxwsTe9bE-qVJ5v7t_NKvgWj3AA/photo/AF1QipO-1REsKsXwEa9p9K1n1BJU6CSGmV4ne9ruC4AU?key=VGVnLWJVOFFrT0M0OG9aZ3BGbmVZd3c4eW1Wc2F3)
