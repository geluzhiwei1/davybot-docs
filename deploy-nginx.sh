#!/bin/bash
set -e
echo "📦 准备部署到 nginx"
echo ""
echo "1. 构建文档..."
cd zh && mdbook build -d ../book && cd ..
cd en && mdbook build -d ../book-en && cd ..
echo "2. 创建部署目录..."
rm -rf deploy
mkdir -p deploy
cp -r book deploy/
cp -r book-en deploy/
echo ""
echo "✅ 部署准备完成!"
echo ""
echo "📁 deploy/"
echo "   ├── book/ (中文)"
echo "   └── book-en/ (英文)"
