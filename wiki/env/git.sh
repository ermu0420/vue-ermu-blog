yum -y groupinstall "Development Tools"
yum -y install zlib-devel perl-ExtUtils-MakeMaker asciidoc xmlto openssl-devel
cd /usr/local
wget https://github.com/git/git/archive/v2.9.2.tar.gz
tar zxvf v2.9.2.tar.gz
cd git-2.9.2
make configure
./configure --prefix=/usr/local/git
make && make install
vim /etc/profile
export PATH="/usr/local/git/bin:$PATH" 
source /etc/profile
cd /usr/local
rm -rf v2.9.2.tar.gz 
rm -rf git-2.9.2/