# Neper For Docker

- Neper 是一个用于多晶生成和网格划​​分的软件包。
> https://neper.info/doc/introduction.html#installing-neper
> 
> https://github.com/neperfepx/neper
- 参考
> https://www.bilibili.com/video/BV1t4411m7ZH?share_source=copy_web&vd_source=d414aaecb744aa2c12565628ee8523ad

## start
- Docker 环境已经具备

- Pull or Build 命令任选其一

```bash
docker pull luckyant/docker-neper:lastest

docker build -t docker-neper:lastest .
```

- 验证

```
docker run -it docker-neper:lastest bash

neper -T -n 10 -id 1 -reg 1

neper -M n10-id1.tess -format inp

neper -V n10-id1.tess -datacellcol id -print image_1

```

