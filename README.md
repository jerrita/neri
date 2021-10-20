
<div align="center">
   <img width="160" src="https://img.jerrita.cn/icon/neri.jpg" alt="logo"></br>
   <h1 align="center"> Neri </h1>

![GitHub CI](https://github.com/jerrita/neri/actions/workflows/R2S-OpenWrt.yml/badge.svg?branch=master)

Another [YAOF](https://github.com/QiuSimons/YAOF) Fork For CQUPT

这个项目的名字来源于：[星空列车与白的旅行中的](https://zh.wikipedia.org/wiki/%E6%98%9F%E7%A9%BA%E5%88%97%E8%BB%8A%E8%88%87%E7%99%BD%E7%9A%84%E6%97%85%E8%A1%8C) [音理](https://www.bilibili.com/read/cv11715478)
</div>

## 简单描述
众所周知，你校睿智的网关会在你登陆校园网后，帮你把内网速率也限制在20M以内，很不人性化。

因此，本固件将通过在 `wan` 口起两个 `macvlan`，并自动配好分流的方式，

让你在村通网的同时，享受到内网的满速带宽。

## 使用方式
1. 在 Release 中下载最新固件
2. 刷机并打开 [neri](http://neri/)([192.168.2.1](http://192.168.2.1/)) 设定密码
3. 进入 网络 -> 接口，将 `wan_global`，`wan_local` 加入 `wan` 防火墙
4. 配置梯子
5. 开启 `MosDNS`
6. 村通网

## 硬件支持列表
- [x] R2S
- [ ] X86 (plan, maybe)
- [ ] Others (gugugu)

## 固件特性
- 支持 `L2TP` 拨号
- 默认安装并启用 `kmod-macvlan` 并以此为基础进行内网分流
- ssp 插件加入 obfs 混淆
- 默认开启并调优 `sqm` 以优化 *20M 光宽带* 的连接体验
- 加入 `Material` 主题
- 插件精简

## 同时具有以下 `YAOF` 特性
- 基于原生 `OpenWrt 21.02` 编译，默认管理地址 192.168.2.1
- 默认开启了 `Software Offload`
- 内置升级功能可用，物理 Reset 按键可用
- 使用 `MosDNS` 同时作为广告过滤手段及dns分流措施
- 可无脑 opkg kmod
- R2S核心频率1.6（交换了LAN WAN）（建议使用5v4a电源，死机大多数情况下，都是因为你用的电源过于垃圾，另外，你也可以选择使用自带的app限制最大频率，茄子🍆）
- O3 编译，CFLAG优化
- ss 协议在 armv8 上实现了 aes 硬件加速（请仅使用 aead 加密的连接方式）
- 集成并默认启用了UKSM，BBRv2，LRNG，以及CacULE Scheduler
- 如有任何问题，请先尝试ssh进入后台，输入fuck后回车，等待机器重启后确认问题是否已经解决
