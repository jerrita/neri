#!/bin/bash

# 在 X86 架构下移除 Shadowsocks-rust
sed -i '/Rust_Client:/d' package/lean/luci-app-ssr-plus/Makefile
sed -i '/Rust_Server:/d' package/lean/luci-app-ssr-plus/Makefile
sed -i '/Rust_Client:/d' package/new/luci-app-passwall/Makefile
sed -i '/Rust_Server:/d' package/new/luci-app-passwall/Makefile
#sed -i '/Rust:/d' package/lean/luci-app-vssr/Makefile

# 内核加解密组件
echo '
CONFIG_CRYPTO_AES_NI_INTEL=y
' >>./target/linux/x86/64/config-5.4

# UKSM
echo '
CONFIG_KSM=y
CONFIG_UKSM=y
' >>./target/linux/x86/64/config-5.4

#Vermagic
latest_version="$(curl -s https://github.com/openwrt/openwrt/releases | grep -Eo "v[0-9\.]+\-*r*c*[0-9]*.tar.gz" | sed -n '/21/p' | sed -n 1p | sed 's/v//g' | sed 's/.tar.gz//g')"
wget https://downloads.openwrt.org/releases/${latest_version}/targets/x86/64/packages/Packages.gz
zgrep -m 1 "Depends: kernel (=.*)$" Packages.gz | sed -e 's/.*-\(.*\))/\1/' >.vermagic
sed -i -e 's/^\(.\).*vermagic$/\1cp $(TOPDIR)\/.vermagic $(LINUX_DIR)\/.vermagic/' include/kernel-defaults.mk

# 预配置一些插件
cp -rf ../PATCH/files ./files

chmod -R 755 ./
find ./ -name *.orig | xargs rm -f
find ./ -name *.rej | xargs rm -f

exit 0
