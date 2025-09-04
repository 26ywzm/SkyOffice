# 使用 Node 官方镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 拷贝根目录的 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install --only=production

# 拷贝整个项目
COPY . .

# 构建前端
RUN npm run build --prefix client

# 暴露端口（根据你的后端端口调整）
EXPOSE 3000

# 启动后端服务
CMD ["npm", "start", "--prefix", "server"]