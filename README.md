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

![phastball](https://lh3.googleusercontent.com/eoCulHw4qFswyu5jb2ONlMbU7hBQ5F3IjjUQoOYtJLiGHA5-DpN17U-4odRUgrg8hRmpIu5cZ-YXwQuB9dMIWAIEywZuUFyP0R5i9fYa6q3iZgRttNFJ80BZ12w9QQDz6okU1kGhkjJ2HenN9tveRGf7vqGPG_JKiKnkZZewrdiljVYydZlmDnEp9QaZPtnZUFCqpwFyvr6dgjbjIKYw9s3BgH3TMBqHplXtuDlKuSS2Yt6chGAksc4pwXXttU0iaUal8N-bBKE_YB2PZoZFZPjRbLuDHATN-WY4sOxRPFZEau9pWibDT3mj8yFibo04RZYfFLySWxpQ3rqD3kqG62ZZEPbOnxbYjk8U3SGCY9TtTuLVV1de730J8ps56Xfq5YUOqbmJIp_AJf7iJP6bDlX5hxFbJ9UNwpwTLXZI3U4rTrtrLeH1fKewZC5xdHlKjyc06RBG_QSoSHR-i_UolLkjJpTmm7ubzTbfEkMkwSrR-YEKkAHQBB5FKHmSONvUmjOjrd7cWIe623hPEPSVnPufZGxkRDoYa47ktWSazT-klmwwUHLvk6FlDtMCojKb2RuMuLs7DyeBzJ1EgYo1EiCffZQLSnDcxl-ooKc=w1183-h665-no)

![profile](https://lh3.googleusercontent.com/fFr_vNLZbSjwLsSM3S0QYOId4L09umUl7hVtJyatNzL8G7hiGKW-sezYcVwKZ2uPHUgt8-o3Yl1UnYXn7-rcfkV_CXtvVfRLrCf0KDk9aQ9o-Lyml64HUplF0e2wGpCTBNKP5hRnW4dY4FeypofZvNvqX-66KJKI8pcxx0VM9ZCWJqw07T4ibGM8cssQ1T1ZVGTYT_6bsyglERQ-V6cNqegazMNzD1mAYoZofs6hZobwoLybXvxzW9Wicg97H1Kp_4m5lrdOkjmbeI5CCbnYFusE0HsEgms9jAX62hLByWcZDumu24UdqgwwkTR54oFu_9jQG6eZqvSjoN69xTb2gHPtJHnVQ097ayf6yalHi0ZVaQot7rl4xGPMJJ-7bzCjegfI_0cM408ErXK5Kk76xU6lWIkmqeHoUBM5htRk6X2yPzDMtYBL8dEm_JzLfUWSOefqOJpT1OmhbURwJMTHxtGbWPiWOgctP4E2n8xUAd5JEwRFa1AZ2gRSmjdqgu3NyywnMCteLf-_Pf0x5H451Wc8P2BZByUt62Y8cFhvoKkTZKQxjWscvFIjzSfZg53pBRJtEP0BSfl2eFBUzrbqtkNl9atk9lU9-Vmzw0o=w960-h475-no)

Using the provided data-set, the PPP Bayes tree example can be utilized as shown below.

````bash
cd ../data
./../build/examples/pppBayesTree -c phastball.conf
````

![error](https://lh3.googleusercontent.com/DVVvyTu-c5uNqZ6v5aXDbxmbzXNqXhNjXy6JBmbyluX-ytcYSYrAMZynSn2Pko-x_zSx8uWwR9AdlUPvvpuOTlfYJXDC2C8a-rD5Wa0IMKxCwK6s351Dsf-pa4sBt3gFeb4hJ4O1HGSLR569QOsBGWwON0Cue3vhZ9WpIwyEH3c3mM66BBsbC7XqSPI_aGIlLfP5P6BUDu-mCDwAo1FxsCcO4PNUjuqGJsoyzE18c3MRAZsf3nD5ra_On1Kz4TDSwSXvxLhvOdeY2PrqkEtxFxxANxROYQXrM6RB8nEZURy2PJ--US9HxQFDBhGNBsSUEpzFrjGiFIA3S6ORPA-WCC9k3wXTdFV2sFYr4vz8zj5ptMD72FFI6u2pz9pIsQrZvVo9qWfuSqAUJXrGxe9p7kCRJ4ja7CD8hzsA52y0p9BGsWwO3YqiQR492EZjIIP_HnV6k5yc7eFx2S4XU2DyS1zSBABv-CzTSgqPsMioRK_5-qmioihlXbMYlfPXu-f4zZPXPvdX_JLwMpmJQwMEGCgxLz-hkPrBshaJ3dn1NItZmtVB-xx9iCgyVGQjXXXeehuEXR7qFCTdvEYUfFeltqpOk4Cvci5DZ7d-zsI=w960-h475-no)
