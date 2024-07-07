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
                    pid1=$!  # 获取第一个launch的进程ID

                    # 等待一段时间以确保第一个launch启动完成
                    sleep 2

                    # 启动第二个launch
                    roslaunch floam floam_mapping_M1.launch &
                    pid2=$!  # 获取第二个launch的进程ID

                    # 等待一段时间以确保第二个launch启动完成
                    sleep 2

                    # 播放 bag 文件
                    rosbag play -s 0 "$bag_file" --clock -r1 
                    sleep 10
                    zenity --info --text="one bag finished！" 

                    # 在 rosbag 播放完成后，结束两个launch进程
                    kill $pid1
                    kill $pid2

                    sleep 3
                    filename=$(basename "$bag_file")
                    substring="${filename:0:7}"
                    substring_lower="${substring,,}"
                    echo "$substring_lower"
                    cp /home/ruanjy/Workspace/M1_ws/liosam_result/evaluater_log/floam_path_grt.txt \
                    /home/ruanjy/Documents/Nutstore/experiment_result/MEMS-LO/figure/matlab_fig/dataset_path/floam/floam_"$substring_lower"_path_grt.txt

                fi
            done
        fi
    done
done