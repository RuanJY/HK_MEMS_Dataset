# HK_MEMS_Dataset
A Multi-LiDAR Dataset on Extreme Mapping Scenarios
# Updates

# Introduction

# Sensor configuration

# Sequences introduction

# Evaluation tutorial
## SLAM adaption
### LO: floam, intensity slam, slamesh
### LIO: liosam, fastlio
### VIO(optional): orbslam3, vins

## Localization evaluation (RMSE of ATE): 
### record pose in tum format
https://github.com/RuanJY/evaluater
### evo
https://github.com/MichaelGrupp/evo
### rpg
https://github.com/uzh-rpg/rpg_trajectory_evaluation
### traj_plot from FusionPortale
https://github.com/fusionportable/fusionportable_dataset_tools/tree/main/tools/traj_plot
### self-defined method based on bus routes
need to be developed

## Mapping evaluation: 
### map quality from fusionportable_dataset_tools (RMSE of RE, COM, CD, with ground truth)
https://github.com/fusionportable/fusionportable_dataset_tools/tree/main/evaluation/map_evaluation

### map entropy from Pointcloud Evaluation Tool (without ground truth)
https://github.com/AIS-Bonn/pointcloud_evaluation_tool

# Acknowledgement
