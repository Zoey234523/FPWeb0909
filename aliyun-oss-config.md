# 阿里云 OSS + CDN 部署详细配置

## 1. OSS 存储桶配置

### 创建存储桶
```bash
# 存储桶配置参数
存储桶名称: fpproductmarket-website
地域: 华东1（杭州）或根据目标用户选择
存储类型: 标准存储
读写权限: 公共读
服务端加密: 无
```

### 上传文件结构
```
根目录/
├── index.html
├── styles.css
├── Founder Park logo/
│   ├── FP Logo.ai
│   ├── FP logo2.png
│   └── img_v2_85f7c0b7-93d1-482c-aa79-8d04ac229cdg.png
└── 飞书产品市集3群二维码.png
```

### 静态网站托管设置
- 默认首页: `index.html`
- 默认404页: `index.html`
- 子目录首页: `index.html`

## 2. CDN 配置

### 基本配置
```bash
加速域名: fpproductmarket.asia
业务类型: 图片小文件
源站类型: OSS域名
源站地址: [选择上面创建的OSS存储桶]
端口: 80
```

### 缓存配置
```bash
# 缓存规则
文件类型: .html
缓存时间: 1小时

文件类型: .css,.js
缓存时间: 30天

文件类型: .png,.jpg,.jpeg,.gif,.ico
缓存时间: 365天
```

### HTTPS 配置
1. 申请免费SSL证书
2. 在CDN控制台上传证书
3. 开启强制HTTPS跳转

## 3. 域名解析配置

### DNS 记录设置
```bash
记录类型: CNAME
主机记录: @
记录值: [CDN分配的CNAME地址]
TTL: 600
```

### 验证配置
```bash
# 检查DNS解析
nslookup fpproductmarket.asia

# 检查网站访问
curl -I https://fpproductmarket.asia
```

## 4. 成本估算

### OSS 费用
- 存储费用: 约0.12元/GB/月
- 请求费用: 0.01元/万次
- 流量费用: 0.5元/GB（外网流出）

### CDN 费用
- 流量费用: 0.24元/GB（国内）
- HTTPS请求: 0.05元/万次

### 预估月费用
- 小型网站（<1GB存储，<10GB流量）: 3-8元/月
- 中型网站（<5GB存储，<50GB流量）: 15-30元/月

## 5. 部署脚本（可选）

如果需要自动化部署，可以使用阿里云CLI：

```bash
# 安装阿里云CLI
curl -O https://aliyuncli.alicdn.com/aliyun-cli-macos-latest-amd64.tgz
tar -xzf aliyun-cli-macos-latest-amd64.tgz
sudo mv aliyun /usr/local/bin/

# 配置访问密钥
aliyun configure

# 上传文件到OSS
aliyun oss cp deploy-package/ oss://fpproductmarket-website/ --recursive

# 刷新CDN缓存
aliyun cdn RefreshObjectCaches --ObjectPath https://fpproductmarket.asia/
```

## 6. 监控和维护

### 设置监控
- 在云监控中设置CDN流量告警
- 设置网站可用性监控
- 配置成本告警

### 定期维护
- 检查SSL证书有效期
- 监控网站访问速度
- 定期备份网站文件

## 7. 故障排除

### 常见问题
1. **域名无法访问**
   - 检查DNS解析是否生效
   - 确认CDN配置正确

2. **图片无法显示**
   - 检查OSS文件路径
   - 确认读写权限设置

3. **HTTPS证书问题**
   - 重新上传证书
   - 检查证书有效期

### 联系支持
- 阿里云工单系统
- 技术支持热线: 95187