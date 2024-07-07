#!/bin/bash

# 设置文件夹路径
root_folder="/media/ruanjy/wyb1/dataset_rjy/HK_MEMS_Dataset"

# 遍历第一层文件夹
for folder1 in "$root_folder"/*; do
    # 检查是否为目录
    if [[ -d "$folder1" ]]; then
        for bag_file in "$folder1"/*.bag; do
            if [[ -f "$bag_file" ]]; then
                echo "压缩文件: $bag_file"
                rosbag compress --lz4 "$bag_file"
                compressed_file="${bag_file%.bag}_compressed.bag"
                mv "$bag_file" "$compressed_file"
                mv "${bag_file%.bag}.orig.bag" "$bag_file"
            fi
        done
    fi
done
