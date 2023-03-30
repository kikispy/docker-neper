FROM --platform=amd64 ubuntu:20.04

LABEL maintainer="Kiki Technology Station For TaoBao"
ENV NEPER_VERSION=V4.5.0

# 非交互式终端
ENV DEBIAN_FRONTEND=noninteractive

# 时区
ENV TZ=Asia/Shanghai
ENV LC_ALL=C

COPY sources/sources.list /etc/apt/sources.list

WORKDIR /root

# 依赖安装
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apt-get update \
    && apt-get install -y gcc g++ cmake make \
            libnlopt-dev imagemagick mpich \
            glibc-doc manpages-posix-dev wget libgmsh-dev libgsl-dev \
            libscotch-dev povray git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN wget -c https://mirrors.tuna.tsinghua.edu.cn/gnu/gsl/gsl-2.7.tar.gz \
    && tar -zxvf gsl-2.7.tar.gz \
    && cd gsl-2.7 \
    && ./configure \
    && make -j10 \
    && make install \
    && cd .. \
    && rm -rf gsl-2.7 gsl-2.7.tar.gz \
    && ldconfig

RUN git https://github.com/neperfepx/neper.git -t ${NEPER_VERSION} \
    && cd neper/src \
    && mkdir build \
    && cd build \
    && cmake -DHAVE_OPENMP=OFF .. \
    && make -j10 \
    && make install \
    && cd  \
    && rm -rf neper

CMD [ "neper" ]