# 网站部署指南 - fpproductmarket.asia

## 方案一：Vercel 部署（推荐 - 最简单）

### 步骤：
1. 访问 [vercel.com](https://vercel.com) 并注册账号
2. 点击 "New Project" 创建新项目
3. 上传项目文件或连接 GitHub 仓库
4. 部署完成后，在项目设置中添加自定义域名 `fpproductmarket.asia`
5. 按照 Vercel 提供的 DNS 配置说明设置域名解析

### 优势：
- 免费且简单
- 自动 HTTPS
- 全球 CDN 加速
- 零配置部署

---

## 方案二：阿里云 OSS + CDN 部署

### 前置准备：
1. 阿里云账号
2. 已备案的域名 `fpproductmarket.asia`

### 部署步骤：

#### 1. 创建 OSS 存储桶
- 登录阿里云控制台
- 进入对象存储 OSS 服务
- 创建 Bucket，选择合适的地域
- 设置读写权限为 "公共读"

#### 2. 上传网站文件
- 将以下文件上传到 OSS 根目录：
  - `index.html`
  - `styles.css`
  - `Founder Park logo/` 文件夹
  - `飞书产品市集3群二维码.png`

#### 3. 配置静态网站托管
- 在 OSS 控制台中，进入 "基础设置" > "静态页面"
- 设置默认首页为 `index.html`
- 设置默认 404 页面为 `index.html`

#### 4. 配置 CDN 加速
- 进入 CDN 控制台
- 添加加速域名 `fpproductmarket.asia`
- 源站类型选择 "OSS 域名"
- 选择刚创建的 OSS 存储桶

#### 5. 配置 HTTPS
- 在 CDN 控制台中配置 SSL 证书
- 可以使用免费的 Let's Encrypt 证书

#### 6. DNS 解析配置
- 在域名解析控制台中
- 添加 CNAME 记录：`fpproductmarket.asia` 指向 CDN 分配的域名

### 费用估算：
- OSS 存储：约 0.1元/月（小型网站）
- CDN 流量：约 0.2元/GB
- 总计：预计每月 1-5 元

---

## 方案三：Netlify 部署

### 步骤：
1. 访问 [netlify.com](https://netlify.com) 并注册
2. 拖拽项目文件夹到 Netlify 部署区域
3. 在站点设置中添加自定义域名
4. 配置 DNS 解析

---

## 方案四：GitHub Pages 部署

### 步骤：
1. 创建 GitHub 仓库
2. 上传网站文件
3. 在仓库设置中启用 GitHub Pages
4. 配置自定义域名

---

## DNS 配置说明

无论选择哪种部署方案，都需要在域名注册商处配置 DNS：

### 对于 Vercel/Netlify：
- 添加 CNAME 记录：`fpproductmarket.asia` 指向服务商提供的域名

### 对于阿里云：
- 添加 CNAME 记录：`fpproductmarket.asia` 指向 CDN 域名

### 验证部署：
部署完成后，访问 `https://fpproductmarket.asia` 验证网站是否正常运行。

---

## 推荐方案

**建议使用 Vercel**，因为：
1. 完全免费
2. 部署简单，几分钟即可完成
3. 自动 HTTPS 和全球 CDN
4. 支持自定义域名
5. 无需复杂配置

如果需要更多控制权或已有阿里云生态，可选择阿里云 OSS 方案。