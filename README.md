
<div align="center">
   <img width="160" src="https://img.jerrita.cn/icon/neri.jpg" alt="logo"></br>
   <h1 align="center"> Neri </h1>

![GitHub CI](https://github.com/jerrita/neri/actions/workflows/R2S-OpenWrt.yml/badge.svg?branch=master)

Another [YAOF](https://github.com/QiuSimons/YAOF) Fork For CQUPT

这个项目的名字来源于：[星空列车与白的旅行中的](https://zh.wikipedia.org/wiki/%E6%98%9F%E7%A9%BA%E5%88%97%E8%BB%8A%E8%88%87%E7%99%BD%E7%9A%84%E6%97%85%E8%A1%8C) [音理](https://www.bilibili.com/read/cv11715478)
</div>

## 简单描述
众所周知，你校逆天的网关会在你登陆校园网后，会帮你把内网速率也限制在20M以内，非常的人性化。

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
- ssrp 插件加入 obfs 混淆
- 默认开启并调优 `sqm` (默认 piece_of_cake) 以优化 **20M 光宽带** 的连接体验
- 加入 `Material` 主题
- 插件精简

## 手动负载均衡指南
> 当你有多个校园网账号时，你可暂时用以下方式进行负载均衡
> 想蹲一个佬写个 luci，不知道能不能等到 =、=
1. 进入网络 -> 接口 -> 设备，新增一个 `MAC VLAN` 并命名
2. 进入网络 -> 接口 -> 接口，新增一个 DHCP 客户端，选择上一步添加的虚拟网卡（记得手动指定跃点）
3. 将此接口加入 `WAN` 防火墙
4. 在网络 -> 负载均衡中进行以下操作：
- 接口：添加此接口
- 成员：新建一个成员，添加上一步添加的接口
- 策略：新建策略 `balance`，添加你想负载均衡的所有接口（不包括 `wan_local`）
- 规则：添加 login 规则，将 `192.168.200.2/32` 分配到你需要登陆的接口
- 规则：修改 default 规则，将策略改为 `balance`
5. 打开 网络 -> SQM QoS，添加实例，上下行限速为 18000（不！要！填！20000），队列使用 `cake: piece_of_cake`，数据包开销为 44
6. 保存并应用
7. 浏览器打开 `192.168.200.2` 进行登陆
8. (Optional) 转第四步，更改 `login` 的接口为其他未登陆的接口

## TODO (Maybe)
- [ ] 写一个 luci 插件用于自动登录校园网
- [ ] 根据插件登陆账号的多少自动调整 `vlan` 与 负载均衡

## 同时具有以下 [YAOF](https://github.com/QiuSimons/YAOF) 特性
- 基于原生 `OpenWrt 21.02` 编译，默认管理地址 192.168.2.1
- 默认开启了 `Software Offload`
- 内置升级功能可用，物理 Reset 按键可用
- 使用 `MosDNS` 同时作为广告过滤手段及dns分流措施
- 可无脑 opkg kmod
- R2S核心频率1.6（交换了LAN WAN）（建议使用5v4a电源，死机大多数情况下，都是因为你用的电源过于垃圾，另外，你也可以选择使用自带的app限制最大频率，茄子🍆）
- O3 编译，CFLAG优化
- ss 协议在 armv8 上实现了 aes 硬件加速（请仅使用 aead 加密的连接方式）
- 集成并默认启用了UKSM，BBRv2，LRNG，以及 CacULE Scheduler
- 如有任何问题，请先尝试ssh进入后台，输入 fuck 后回车，等待机器重启后确认问题是否已经解决
