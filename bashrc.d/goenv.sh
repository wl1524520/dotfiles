# golang env

# 启用 Go Modules 功能
go env -w GO111MODULE=on

# 配置 GOPROXY 环境变量，以下三选一

# 1. 七牛 CDN
go env -w  GOPROXY=https://goproxy.cn,direct

# 2. 阿里云
# go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

# 3. 官方
# go env -w  GOPROXY=https://goproxy.io,direct

export PATH=$PATH:`go env GOPATH`/bin:$GOPATH/bin:$HOME/protoc/bin

