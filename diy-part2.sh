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

# 修改后台默认IP地址
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/luci/bin/config_generate

# 修改wan6接口协议为none
sed -i "s/set network.\${1}6.proto='dhcpv6'/set network.\${1}6.proto='none'/g" package/base-files/files/bin/config_generate
sed -i "s/set network.\${1}6.proto='dhcpv6'/set network.\${1}6.proto='none'/g" package/base-files/luci/bin/config_generate

# 修改主机名
sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/luci/bin/config_generate

# 切换内核
# sed -i 's/6.12/6.18/g' target/linux/x86/Makefile

