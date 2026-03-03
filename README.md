# DavyBot 文档系统

## 快速开始

### 构建

```bash
./build-all.sh      # 构建所有语言版本
./deploy-nginx.sh   # 准备部署文件
```

### 本地测试(可选)

```bash
python3 -m http.server 8000 --directory deploy
# 访问 http://localhost:8000/book/
```

### Nginx 部署

```bash
rsync -av deploy/ user@server:/var/www/davybot-docs/
```

详细文档: [DEPLOYMENT.md](./DEPLOYMENT.md)

## 目录结构

```
docs/
├── zh/              # 中文版(完全独立)
│   ├── book.toml    # 配置文件
│   └── src/         # 源文件
├── en/              # 英文版(完全独立)
│   ├── book.toml    # 配置文件
│   └── src/         # 源文件
├── book/            # 中文构建输出
├── book-en/         # 英文构建输出
└── theme/           # 自定义主题
```

## 脚本

- `build-all.sh` - 构建所有语言版本
- `deploy-nginx.sh` - 准备 nginx 部署文件
