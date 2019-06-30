curl -sL https://rpm.nodesource.com/setup_10.x | bash -
yum install -y nodejs
node -v
npm install -g cnpm --registry=https://registry.npm.taobao.org
npm config set registry https://registry.npm.taobao.org
cnpm install yarn -g
yarn global add vuepress