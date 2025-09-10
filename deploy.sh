#!/bin/bash

# 网站部署准备脚本
# 用于 fpproductmarket.asia 域名部署

echo "🚀 准备部署 AI产品市集网站到 fpproductmarket.asia"
echo "================================================"

# 检查必要文件
echo "📋 检查必要文件..."
files=("index.html" "styles.css" "vercel.json")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file 存在"
    else
        echo "❌ $file 缺失"
        exit 1
    fi
done

# 检查图片资源
echo "\n🖼️  检查图片资源..."
if [ -f "Founder Park logo/FP logo2.png" ]; then
    echo "✅ Logo 文件存在"
else
    echo "❌ Logo 文件缺失"
fi

if [ -f "飞书产品市集3群二维码.png" ]; then
    echo "✅ 二维码文件存在"
else
    echo "❌ 二维码文件缺失"
fi

echo "\n📦 创建部署包..."
# 创建部署目录
mkdir -p deploy-package

# 复制必要文件
cp index.html deploy-package/
cp styles.css deploy-package/
cp vercel.json deploy-package/
cp -r "Founder Park logo" deploy-package/
cp "飞书产品市集3群二维码.png" deploy-package/

echo "✅ 部署包已创建在 deploy-package 目录"

echo "\n🌐 部署选项："
echo "1. Vercel 部署（推荐）："
echo "   - 访问 https://vercel.com"
echo "   - 上传 deploy-package 文件夹"
echo "   - 添加自定义域名 fpproductmarket.asia"
echo ""
echo "2. 阿里云 OSS 部署："
echo "   - 参考 deploy-guide.md 详细说明"
echo "   - 上传 deploy-package 内的所有文件到 OSS"
echo ""
echo "3. Netlify 部署："
echo "   - 访问 https://netlify.com"
echo "   - 拖拽 deploy-package 文件夹到部署区域"

echo "\n📖 详细部署指南请查看 deploy-guide.md 文件"
echo "🎉 准备完成！选择合适的部署方案开始部署吧！"