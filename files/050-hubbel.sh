#!/bin/bash

logger "FirstBoot: Set 'camera_auto_detect=1' in /boot/config.txt"

sed -i "s/camera_auto_detect=0/camera_auto_detect=1/" /boot/config.txt