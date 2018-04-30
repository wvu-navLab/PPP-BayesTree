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

![phastball](https://lh3.googleusercontent.com/FMbPIifAl7RCyEnC6IzaxrnjyLJNF3eh_pS_SEKK3UdfD3D9MZvsrleZw6l3bPTO7qWQUtChMUhPMzwQ-Mq-cFDaeDZbDPGA9vQ7DQVzBk9lKasVdhcqrqTKCpIv5buVrMxYXFAXNeLfa_zeYGH_ccuUT3rg_cpHsULX8C8Tk0b5urjci1g-lDYEpwiaYpzoGEI7DYiHkHGFQYHYxaxzuVOUbu5ScoqdTkB_U4-cblDcEdmJEOvgYaiB_dwmEuDsOHCK_9Imak0OWOmvzdN-0_dBWkIRm0n0HsPsNzqtDWCbKensz11lwu-OhfS1UxHxpwEpFVDwYP9i9y6_ZY2WvT81UnPXj71eXGWgxt_Opisz2k1aBH12n2F29OxVZmCoEIIiJqAF08XmMUc_Ki7XoEmWg5a761D4G1htFJW8xu2tqRf6Aa5eCX11hzdVMPPeeH3zUStsEyLCZZMXsfuC1358ZJ5ORL_UEUzzYJK9fH2UTZ1j4d40gJdxHfx1hliKcguvJNlLnrMJiO0ezl0LWNyi9d2UrnE5Qa7iaVunFeGGMZPUjJ_JtN80mD_glMCmm7nW28vjwhhGnXinz_lQdGmQ1nGYGxCgXzGUNfMD1ukhysg-7QMY0Hgps9z5exY-y92WLaMuos2Nd1fzFVaI8XGYoDCzzgBn=s250-k-rw-no)

![profile](https://lh3.googleusercontent.com/XIz6PcvRyMNipkMv3oCSeS43SPYPqbirxNfIvBdj4c4LgUEGxBG7U1JxJzW0zsHYIL_wIWWdRoi_RMEuDdfHcXzdzYx7BbbrKtHowndnyd0hdmaaauUPDH0UqIch5tvsoLeYhiVUHPhvwMOMoo0IfQnWNWB7XfCwcRfgyVPpi72oHEcuDs7JA-bFg99BmI9Z8hjz36rxzSJSMvWNIm6SKJzx9fjs3FZ2cdPhwpGrkG8ZeDLFLoCdaXuv9M8-HDuniPZGSR6J25kzLwL_-4YZZES0kztRwCSbQPUlxWQ1KA6D34UvQGwQ9ZhhMCntauTIgIbOLkjI_XApPmqm8ZyTS4w_slZCjAfhxM2SSrXLAziFkNloYUrD-J4PWwOCQtzSE51EADakq-RMRBf2D1tS5VYvKqhT6C1YllQSfHtu_sYXRu4-45MeQdxURQEVHjOPl6-7mT9R1CWYEnXqWCken6XVaMTpKGL1Jr3plyO9odD74PbfZJCruzd3aaaNbVEHNezcJAKeuhyglqtybhto2CH7odkvD88upENvJO3mxDmqy_O6Dw0bebbalzbXq4Dr2_BMWTI_NIYrDz5xY3cShVvuWFsDbjGQChgxg0RwpjIIIPfDCef1unFjMSr7NhnUYIXCkNLtfnmn39W2-7Cu0af9Exhh5AhI=w960-h475-no)

Using the provided data-set, the PPP Bayes tree example can be utilized as shown below.

````bash
cd ../data
./../build/examples/pppBayesTree -c phastball.conf
````

![error](https://lh3.googleusercontent.com/Xto8l2eGrgHZlj3dzDlR-LZhqidpAgedcj07eV-Pr5l1ZMl2FSt5TTb0pdvk7ISeJ9-Lu4Db9oDPf6TSlB-Mypn66SFBQP6eV5b2fPDB1aUdPI8Fyt5831nDUQQrZvg3pLfKxrHgJUcByBqEPgYblIeqqkZioMbPnEpno89vY1p98hn2DOrOQG-20eNfJo6vhHljcgnSExPgsNJi899oQz97NWFWpbmggQL-ovEcznvn-C619XonolxtX9BRkk5aWLMSi-V-XvRzUyOcOCj_XRJiDXlvZGgLlaczDMO97HeLzCs8kVoaA-C7Drw2OCGuu3k38KfqfthHcA0096BkmsXC7fkz0aeggDpvYtt_oH21eZGrhW3SxWqkSaDXuykZri5RT8H1Dk9jfyx68fkQOexfmPITh0is1NABht36ev_yZUCs72aLz15QIGaH6r4TOonrFYkk1zLVtIJ86Q0HOBhgOkxE5P5r0uLpydI4yO3Hfm3pt1j_fJ08IXTXLTQH5YTaMhBN8f16xD597w7A_2Iu7yTvSJmS3nd2AawzeqGbU1enAAzDKu2Mi-j2WQfMfTLZk_zE4J2PNJ0fGGYl6H8hgNx284v-MHlFvNQ_5IiZbdPcWBUS8uUSd8p2MvlnYLlUwkktI2UQR6gaODaIsQCWDsENPnPm=s250-k-rw-no)
