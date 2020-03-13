# Use Fedora latest (31)
# credits to GitHub @najahiiii
FROM fedora:latest
LABEL maintainer "goodmeow(Harun) <harunbam3@gmail.com>"

# Indonesian timezone (GMT+7)	
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY che-llvm.repo /etc/yum.repos.d/
COPY lantw44-arm-gcc.repo /etc/yum.repos.d/
COPY lantw44-arm64-gcc.repo /etc/yum.repos.d/

RUN dnf install -y \
	aarch64-linux-gnu-{binutils,gcc,glibc} \
	arm-linux-gnueabi-{binutils,gcc,glibc} \
	bc \
	bison \
	clang \
	curl \
	diffutils \
	flex\
	git-core \
	gnupg1 \
	hostname \
	java-latest-openjdk-headless \
	libtool \
	llvm \
	lld \
	m4 \
	make \
	openssl-devel \
	python \
	shtool \
	wget \
	which \
	zip \
	&& dnf clean all

# Git
RUN git config --global user.email "harunbam3@gmail.com"
RUN git config --global user.name "goodmeow"

RUN git clone https://github.com/NusantaraDevs/clang.git -b dev/11.0 --depth=1 --single-branch /root/clang

CMD ["/bin/bash"]