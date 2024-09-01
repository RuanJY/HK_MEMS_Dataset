#!/bin/bash

# 播放 rosbag
# rosbag play your_bag_file.bag

# 播放完成后弹出提示窗口
zenity --info --text="one bag finished！" 
echo "继续执行其他命令..."
