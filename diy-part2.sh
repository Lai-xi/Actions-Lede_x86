#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 默认地址
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 切换内核
sed -i 's/6.1/5.15/g' target/linux/x86/Makefile
sed -i 's/6.1/5.15/g' target/linux/rockchip/Makefile

# 修改eth0为默认wan口 eth1为默认lan口
sed -i "s/lan 'eth0'/lan 'eth1'/g" package/base-files/files/etc/board.d/99-default_network
sed -i "s/ucidef_set_interface_wan 'eth1'/ucidef_set_interface_wan 'eth0' \&\& ucidef_set_interface_lan 'eth1' || ucidef_set_interface_lan 'eth0'/g" package/base-files/files/etc/board.d/99-default_network



