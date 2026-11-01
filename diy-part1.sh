#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 启用24版Luci
# sed -i '/luci\.git;openwrt/ { /^[^#]/ s/^/#/ }' feeds.conf.default
# sed -i '/openwrt-24.10/ s/^#//' feeds.conf.default

# Add a feed source
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
git clone --depth=1 https://github.com/fw876/helloworld


# Add Nikki(MiHomo)
# echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> "feeds.conf.default"


# Add DDNSTO
# echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
# echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default


# Add cpufreq
# rm -rf ./feeds/luci/applications/luci-app-cpufreq
# svn co https://github.com/DHDAXCW/luci-bt/trunk/applications/luci-app-cpufreq ./feeds/luci/applications/luci-app-cpufreq
# ln -sf ./feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq
# sed -i 's,1608,1800,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
# sed -i 's,2016,2208,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
# sed -i 's,1512,1608,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq

# Add OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# Add Lucky_wanji
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky
LUCKY_VERSION=$(curl -fsSL https://release.66666.host/ \
  | grep -oE 'href="./v[0-9]+(\.[0-9]+)+/"' \
  | sed -E 's|href="./v([^/]+)/"|\1|' \
  | sort -V \
  | tail -n 1)
if [ -z "$LUCKY_VERSION" ]; then
  echo "错误：获取万吉 Lucky 版本号失败"
  exit 1
fi
MAKEFILE="package/lucky/lucky/Makefile"
echo "万吉 Lucky 核心版本：$LUCKY_VERSION"
sed -i "s/^PKG_VERSION:=.*/PKG_VERSION:=${LUCKY_VERSION}/" "$MAKEFILE"
sed -i 's|^PKG_SOURCE:=.*|PKG_SOURCE:=lucky_$(PKG_VERSION)_Linux_$(LUCKY_ARCH)_wanji.tar.gz|' "$MAKEFILE"
sed -i 's|^PKG_SOURCE_URL:=.*|PKG_SOURCE_URL:=https://release.66666.host/v$(PKG_VERSION)/$(PKG_VERSION)_wanji|' "$MAKEFILE"


# Add luci-app-bandix
git clone https://github.com/timsaya/openwrt-bandix.git package/bandix
git clone https://github.com/timsaya/luci-app-bandix.git package/luci-app-bandix

# Add luci-app-wechatpush
git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush

# Add OpenAppFilter
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
