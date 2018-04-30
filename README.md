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

![phastball](https://lh3.googleusercontent.com/ry8cUSj1bRcOG2Oz0ckFlbneHLCugLFkaANQ5UMNr4uvDwUaVEzNXi0faHoJaKKRdVdI2Aw6hvmGZ5FIcat1GK5ynlegdHN3gpQpBW9-qsH6hQd6gmDTd2L8kQNeU6lsGHho-tpVAyEj24LO9B6zYzEFm7AmNuIC6qk1YRjE2SIYpOur2ESdijoQG0r7vmxzjiua2WyeN7HRFyuieNjf2EciIyvXrCKHChuXhOigW_9W5FS1LlTp9egGWBprqA0DRmZ95djmuC5rzkHk2MAwNsdXVpaISL7QFkTRXZcGIgqr8xNg8xG_sPNNS-urW_t0eXQTcQd2OZE-RkBxeEZcEQlEZT-aoBvtHwEXTFtZ806K2qscc_dr0C4C1pNDk8fg26sPKjCR-6B0JyDaNgYi7UGb5ykaIDGFVT9KWphCMcCvODNj4J0WKbK7hqUc_d3OLFyV_O5cqp0j6w2yI4c5ii9MMcNRxXH0G5dDjOc8Wg_FpaQqOwMxhJH_QX0258mFFEOIgfSarC6s_i07mtqYpR1sju8g_Sk3yQNbigqo2fPP2sYqOYyss2_1jTs8_LOvApIMTzRbOxyuOK_tBbLvSwRlJwG9jpHl1mVd9B0uRVJVCi758zkM8HQg8GknDPcoOwbZiOmNge_y_sgHlsAxMNF4Dmc8RpEh=w1183-h665-no)

![profile](https://lh3.googleusercontent.com/XIz6PcvRyMNipkMv3oCSeS43SPYPqbirxNfIvBdj4c4LgUEGxBG7U1JxJzW0zsHYIL_wIWWdRoi_RMEuDdfHcXzdzYx7BbbrKtHowndnyd0hdmaaauUPDH0UqIch5tvsoLeYhiVUHPhvwMOMoo0IfQnWNWB7XfCwcRfgyVPpi72oHEcuDs7JA-bFg99BmI9Z8hjz36rxzSJSMvWNIm6SKJzx9fjs3FZ2cdPhwpGrkG8ZeDLFLoCdaXuv9M8-HDuniPZGSR6J25kzLwL_-4YZZES0kztRwCSbQPUlxWQ1KA6D34UvQGwQ9ZhhMCntauTIgIbOLkjI_XApPmqm8ZyTS4w_slZCjAfhxM2SSrXLAziFkNloYUrD-J4PWwOCQtzSE51EADakq-RMRBf2D1tS5VYvKqhT6C1YllQSfHtu_sYXRu4-45MeQdxURQEVHjOPl6-7mT9R1CWYEnXqWCken6XVaMTpKGL1Jr3plyO9odD74PbfZJCruzd3aaaNbVEHNezcJAKeuhyglqtybhto2CH7odkvD88upENvJO3mxDmqy_O6Dw0bebbalzbXq4Dr2_BMWTI_NIYrDz5xY3cShVvuWFsDbjGQChgxg0RwpjIIIPfDCef1unFjMSr7NhnUYIXCkNLtfnmn39W2-7Cu0af9Exhh5AhI=w960-h475-no)

Using the provided data-set, the PPP Bayes tree example can be utilized as shown below.

````bash
cd ../data
./../build/examples/pppBayesTree -c phastball.conf
````

![error](https://lh3.googleusercontent.com/I8a6-1VtvxDhnbevI8Dgpa4slTOZPvLQ0m-3DL7q9c8pGrUitAVyNEKReoimNAJ-udGi4h-kSHhJIOP_9HqBNu2vlP6L73DYXuwH-n9LGpPPxnHXoYoDURsrfC7jZyFGELTMhVlMUFPm_ir4WMdEdsQpv5_2Kp8MXpUfBGaRUA8vaBwXnvCAT6xfwUje7GQECsqjlaf90s9FChDKHqHjP8f8HsiVdLGXbf6QBb4WSkeYduBZMebV89hYT-gcSs3MdCkcmLUUJBfv07PgZjsGMSvj04bz79qW_C2_McfTdnUcn70-oKOsfIe4gJC7V_5zCL7-9j6sxjIh4eXrfpaGrOICqtUr7GKpGPDQ22bpRtehqsFOg5sOQIvjDn3p91JGvTq5WWTP4GuCqb4yR5I3EAh-vRTvHMOwJhfglcxnl1mvyGrwwIOK7q6IacaBu9EyEnL-UG5FG6NiZ-jCE4D1l1ou7QYVE-c9-kzkFeL-s-Mqzq64sH7Sta0_qgS3ZzaZWSyctV17xZH7Vv7FDei_i0B7RvI9FGAWzeaLXJNqdL49VDDEhHfSLxeFZqZAkdgPqeCFxv2U64rsIbaRWo7e4mam4547fuYeq6PWcpblJ6AqZdRAeKZWBmJa9IFjV32UdC46QioXhRfI5Qt9VC8bq4CcDpnsyw1a=w960-h475-no)
