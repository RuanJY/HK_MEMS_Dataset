#!/bin/bash
echo "do somthing for all sequence of dataset"

# 设置文件夹路径
root_folder="/media/ruanjy/wyb1/dataset_rjy/HK_MEMS_Dataset_compressed/bag"

# 遍历第一层文件夹
for folder1 in "$root_folder"/*; do
    # 检查是否为目录
    echo "$folder1"
    for folder2 in "$folder1"/*; do
        echo "$folder2"
        if [[ -d "$folder2" ]]; then
            for bag_file in "$folder2"/*.bag; do
                 echo "$bag_file"

                if [[ -f "$bag_file" ]]; then
                    echo "bag_file: $bag_file"

                    cd ~/Workspace/M1_ws
                    source devel/setup.bash
                    roslaunch evaluater run.launch &

                    # 等待一段时间以确保 roslaunch 启动完成
                    sleep 2

                    # 播放 bag 文件
                    rosbag play "$bag_file" --clock -r10 

                    # 在 rosbag 播放完成后，结束 roslaunch
                    pkill -f "run.launch"
                    sleep 5
                    filename=$(basename "$bag_file")
                    substring="${filename:0:7}"
                    echo "$substring"
                    cp /home/ruanjy/Workspace/M1_ws/liosam_result/evaluater_log/imu_hh1_path_grt.txt /home/ruanjy/Documents/Nutstore/experiment_result/MEMS-LO/figure/matlab_fig/dataset_path/imu/imu_"$substring"_path_grt.txt

                fi
            done
        fi
    done
done
