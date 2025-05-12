# HK_MEMS_Dataset
HK-MEMS, a MEMS LiDAR dataset on urban tunnels and dynamic scenarios

# Updates

- 12 May 2025, all **data** are avaliable at ([Data_download](https://1drv.ms/f/c/7de4f2ce1de30586/EoYF4x3O8uQggH1g1gAAAAABHtm7xdSWAF3Q12S6Wyertg?e=MB0NVu), password: HK_MEMS_Dataset)  

- 06 Mar 2025, Introduction **video** are available at： [youtube](https://youtu.be/skkPn5g-ow4) or [bilibili](https://www.bilibili.com/video/BV1fUX9YWEZW/?vd_source=a7075e8cce0b5d3273610c2b2539377d)

- 01 Sep 2024, this repo is opened. Sample **data** is provided. ([Sample_data_download](https://1drv.ms/f/s!AoYF4x3O8uR9g6xkP0XRGdjlE7QinQ?e=Lsf5gY), password: HK_MEMS_Dataset). The full dataset will be released after revision according to the review feedback.

- 01 Sep 2024,  Preprint of **paper** are avaliable at :[preprint](https://www.authorea.com/users/827764/articles/1222288-hk-mems-a-mems-lidar-dataset-on-urban-tunnels-and-dynamic-scenarios?commit=85aa01e4cb9960742dcded7638fb1705f420c1a8)

# Introduction
This paper presents HK-MEMS, a multimodular dataset incorporating data from MEMS LiDARs, a camera, GNSS, and Inertial Navigation Systems. To our best knowledge, it is the first dataset to offer automotive-grade MEMS LiDAR data on urban roads for research in Simultaneous Localization and Mapping (SLAM).

This dataset emphasizes **extreme environments** like degenerate urban **tunnels** and **dynamic** scenarios, aiming to enhance the robustness of SLAM systems.

We collected 187 minutes and 75.4 kilometers of data. State-of-the-art SLAM methods are evaluated on this benchmark. The result highlights the challenges in extreme environments and underscores the ongoing need to enhance **the robustness of SLAM systems**.
This dataset serves as a valuable platform for exploring the potential and limitations of MEMS LiDAR and poses a challenge to enhance the robustness of SLAM in urban navigation scenarios.

**Introduction video**:

<div align=center>
<a href="https://youtu.be/skkPn5g-ow4" target="_blank"><img src="document/figure/cover-small.png" alt="video1" width="85%" /></a>
</div>

(or watch it on [bilibili](https://www.bilibili.com/video/BV1fUX9YWEZW/?vd_source=a7075e8cce0b5d3273610c2b2539377d))

# Configuration

## Sensors

The sensor suite in our dataset:

- A Robosense M1 MEMS LiDAR
- A 32-beam Ouster OS1-32 mechanical LiDAR
- A RealSense L515 LiDAR (used as a camera in outdoor environments)
- A Xsens MTI-30 IMU
- A CUAV V5+ flight controller (used as an INS system) with RTK-GPS
- An Intel NUC mini computer.

<p align="center">
  <img src="document/figure/sensor_suite.png" alt="sensor_suite.png" width="50%">
</p>

[//]: # (Main functions and measurements of each sensor:)


## Platforms

- Handheld platform
- Mobile robot
- Buses

<p align="center">
  <img src="document/figure/mobile_robot_and_bus.png" alt="mobile_robot_and_bus.png" width="70%">
</p>

# Scenarios

This dataset concentrates on the typical and challenging scenarios in urban mapping and localization.
It can serve as a benchmark platform for investigating issues such as **degenerate structure, high-speed motion, dynamic noise, and altitude drift**.


<p align="center">
  <img src="document/figure/fig-hk-sequence-map2.png" alt="fig-hk-sequence-map2.png" width="70%">
</p>

Main features and challenges of 26 sequences and three groups:
<p align="center">
  <img src="document/figure/group_description.png" alt="group_description.png" width="100%">
</p>

## Dyna-pedestrian group
6 sequences in densely populated residential zones;
- HH1: mapping the HK Coliseum with minimal dynamic objects, handheld, easy;
- HH2 and HH3: degenerate subway passages or footpaths, mobile robot, moderate.
- MK1-3: many dynamic objects that are very close to the sensors, handheld, challenging; 
## Dyna-vehicle group
6 sequences gathered on urban roads, the platform is bus.
- Low-speed sequences (CB1, CD1, NP1, TST1) in commercial areas, easy;
- High-speed sequences in suburban locales (PFL1) and cargo terminals (TY1), moderate.

Images from the Dyna-pedestrian and Dyna-vehicle groups:
<p align="center">
  <img src="document/figure/dyna_seq_image4.png" alt="dyna_seq_image4.png" width="100%">
</p>

## Tunnel group
14 sequences were recorded within 5 tunnels located beneath the sea or mountains. Multiple recordings for each tunnel are provided, showcasing varying times, weather conditions, traffic volumes, and directions. Challenging.

Images from the Tunnel group :
<p align="center">
  <img src="document/figure/tunnel_seq_image4.png" alt="tunnel_seq_image4.png" width="100%">
</p>

# Ground Truth
- **RTK-**.
-  provides precise 3D position measurements with centimeter-level accuracy.
  (HH1, HH2)
<p align="center">
  <img src="document/figure/gps-slam-path.png" alt="gps-slam-path.png" width="50%">
</p>

- **Bus Route data**.
-  In sub-terrain tunnels or urban canyons with a poor GPS signal, reliable trajectory references can be derived from the bus route data from the government.
  (Dyna-vehicle group and Tunnel group)
<p align="center">
  <img src="document/figure/ground_truth_bus_routes.png" alt="ground_truth_bus_routes.png" width="50%">
</p>

- **Altitude**
Altitude references are established through smoothed air pressure readings from the barometer integrated within the CUAV V5+ INS system.
<p align="center">
  <img src="document/figure/ground_altitude.png" alt="ground_altitude.png" width="50%">
</p>

- If GPS and bus route data are unavailable, the start-to-end drift is used for evaluation (HH3, MK1-3).

# Evaluation

## Evaluated SLAM
We adapted and tested several SLAM methods to the MEMS LiDAR in this dataset, including:
- F-LOAM: LO, point-based, need to modify the feature extraction 
- SLAMesh: LO, model-based, no modification needed.
- FAST-LIO2: LIO system, filter-based, no feature extraction needed.
- LIO-SAM: LIO system, factor-graph-based, needs to modify the feature extraction.
  
In LIO systems, notice that the timestamp of each frame of the point cloud in M1 LiDAR is the time when the last point is collected.

To record pose in the tum format, you can use https://github.com/RuanJY/evaluater

## Localization accuracy:

The reference bus routes path and the sensor data used in SLAM are collected in different coordinate frames.
We align the two paths first and then compute a metric called Relative Root Mean Square Error (RRMSE).

- The Dyna-vehicle group shows the lowest errors.
- The MK1-3 sequences present significant challenges.
- The Tunnel group exhibits the highest error.

<p align="center">
  <img src="document/figure/rrmse_result.png" alt="rrmse_result.png" width="80%">
</p>

Comparison of trajectories estimated by SLAM (red paths) and the ground truth path (blue path) in the HK-MEMS dataset.

SLAM performance is classified as
- Failed, RRMSE > 10\% (orange border),
- Acceptable, 5\% < RRMSE < 10\% (yellow border),
- Precise, RRMSE < 5\% (green border).

<p align="center">
  <img src="document/figure/result_floam_fastlio.png" alt="result_floam_fastlio.png" width="80%">
</p>

# Download

All **data** are avaliable at ([Data_download from Onedrive](https://1drv.ms/f/c/7de4f2ce1de30586/EoYF4x3O8uQggH1g1gAAAAABHtm7xdSWAF3Q12S6Wyertg?e=MB0NVu), password: HK_MEMS_Dataset)  


# Acknowledgement

The authors would like to thank the kind assistance from Yibo Wang, Guangzhi Tian, and Zhuoyuan Liu, who help to build the hardware system. 
