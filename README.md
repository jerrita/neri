# Neri

> Forked from [YAOF](https://github.com/QiuSimons/YAOF)

管理地址为：192.168.2.1

## 简单描述
本固件将在 `wan` 口起两个 `macvlan`，并自动帮你配好分流
即可在村通网的同时享受内网满速带宽

## 使用方式
1. 在 Release 中下载最新固件
2. 刷机并打开 [https://neri](http://neri/)(192.168.2.1) 设定密码
3. 进入 网络 -> 接口，将 `wan_global`，`wan_local` 加入 `wan` 防火墙
4. 配置梯子
5. 开启 `MosDNS`
6. 村通网

## 固件支持列表
- [x] R2S
- [ ] X86 (plan, maybe)
- [ ] Others (gugugu)

## Notice
验证中，即将完成
