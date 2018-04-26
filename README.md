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

![phastball](https://lh3.googleusercontent.com/pICG7s5vOD0TRcBm91NfopPXVFaSTVJN7sGNQ-D9wWHt87NXlnjxyP2vlWq50rw-R5ZGISCEQ3Cv2NNYe8OXLKC0QqmRgePMSTQVrEdlvNndYRxQUNPI46_3NY8F47SXQhKtxdb5o-0zxfQ6qLuDIt3Vdxc20AKgL-VNBpGa9EGSFHxESjy89snZSqCRDfBQFubq2CZhNtJHXbGG6rSyYOQKga4riogH10S-8ya9uzPE7Kl-2exHECwPNyatlzc6ewOGC44gxu0ZvKZYFdrajI63cvARJBxP6NpMxamou7ropolUds4q8yK4GXvhPKWH4N3UVav1vvkLasSxSY5I2y2OaG18ITziusvMsyxi_Y02yPKyUdMdPU8gZAqIL2nmjzEkn1OhGK8rU3sFwpDgKc8cIivGJNkgQCCOBSjwXl3dGtntXTtuJ4FMSHi10d4MphWmcgFlOSR6vcM3Qy171m17-47GUA8DEyEjSoenNOpFBCBE2OUBo4pttzv6IAYAT7fnTzs0g-deJzyMQv-sacXstSzL5IDKPqgl0MGi0U4zbhLceLKhw44b8bovYUhb01e3y5tyv0fRNR4yXZTH_0H-fxhvbhd1rOjjGoE=w1183-h665-no)

![profile](https://lh3.googleusercontent.com/fFr_vNLZbSjwLsSM3S0QYOId4L09umUl7hVtJyatNzL8G7hiGKW-sezYcVwKZ2uPHUgt8-o3Yl1UnYXn7-rcfkV_CXtvVfRLrCf0KDk9aQ9o-Lyml64HUplF0e2wGpCTBNKP5hRnW4dY4FeypofZvNvqX-66KJKI8pcxx0VM9ZCWJqw07T4ibGM8cssQ1T1ZVGTYT_6bsyglERQ-V6cNqegazMNzD1mAYoZofs6hZobwoLybXvxzW9Wicg97H1Kp_4m5lrdOkjmbeI5CCbnYFusE0HsEgms9jAX62hLByWcZDumu24UdqgwwkTR54oFu_9jQG6eZqvSjoN69xTb2gHPtJHnVQ097ayf6yalHi0ZVaQot7rl4xGPMJJ-7bzCjegfI_0cM408ErXK5Kk76xU6lWIkmqeHoUBM5htRk6X2yPzDMtYBL8dEm_JzLfUWSOefqOJpT1OmhbURwJMTHxtGbWPiWOgctP4E2n8xUAd5JEwRFa1AZ2gRSmjdqgu3NyywnMCteLf-_Pf0x5H451Wc8P2BZByUt62Y8cFhvoKkTZKQxjWscvFIjzSfZg53pBRJtEP0BSfl2eFBUzrbqtkNl9atk9lU9-Vmzw0o=w960-h475-no)

Using the provided data-set, the PPP Bayes tree example can be utilized as shown below.

````bash
cd ../data
./../build/examples/pppBayesTree -c phastball.conf
````

![error](https://lh3.googleusercontent.com/DVVvyTu-c5uNqZ6v5aXDbxmbzXNqXhNjXy6JBmbyluX-ytcYSYrAMZynSn2Pko-x_zSx8uWwR9AdlUPvvpuOTlfYJXDC2C8a-rD5Wa0IMKxCwK6s351Dsf-pa4sBt3gFeb4hJ4O1HGSLR569QOsBGWwON0Cue3vhZ9WpIwyEH3c3mM66BBsbC7XqSPI_aGIlLfP5P6BUDu-mCDwAo1FxsCcO4PNUjuqGJsoyzE18c3MRAZsf3nD5ra_On1Kz4TDSwSXvxLhvOdeY2PrqkEtxFxxANxROYQXrM6RB8nEZURy2PJ--US9HxQFDBhGNBsSUEpzFrjGiFIA3S6ORPA-WCC9k3wXTdFV2sFYr4vz8zj5ptMD72FFI6u2pz9pIsQrZvVo9qWfuSqAUJXrGxe9p7kCRJ4ja7CD8hzsA52y0p9BGsWwO3YqiQR492EZjIIP_HnV6k5yc7eFx2S4XU2DyS1zSBABv-CzTSgqPsMioRK_5-qmioihlXbMYlfPXu-f4zZPXPvdX_JLwMpmJQwMEGCgxLz-hkPrBshaJ3dn1NItZmtVB-xx9iCgyVGQjXXXeehuEXR7qFCTdvEYUfFeltqpOk4Cvci5DZ7d-zsI=w960-h475-no)
