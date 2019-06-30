# 安装编译工具及库文件
yum -y install make zlib zlib-devel gcc-c++ libtool  openssl openssl-devel
# 安装 PCRE PCRE 作用是让 Nginx 支持 Rewrite 功能。
cd /usr/local/src/
wget http://downloads.sourceforge.net/project/pcre/pcre/8.35/pcre-8.35.tar.gz
tar zxvf pcre-8.35.tar.gz
cd pcre-8.35
./configure
make && make install
pcre-config --version
cd /usr/local/src/
rm -f pcre-8.35.tar.gz

cd /usr/local
wget http://nginx.org/download/nginx-1.6.2.tar.gz
tar zxvf nginx-1.6.2.tar.gz
cd nginx-1.6.2
./configure --prefix=/usr/local/nginx \
--with-http_stub_status_module --with-http_ssl_module \
--with-pcre=/usr/local/src/pcre-8.35
make
make install
cd /usr/local
rm -rf nginx-1.6.2.tar.gz
rm -rf nginx-1.6.2/

vim /etc/init.d/nginx
chmod a+x /etc/init.d/nginx
# 将nginx服务加入chkconfig管理列表
chkconfig --add /etc/init.d/nginx
# 最后设置开机自动启动
chkconfig nginx on
