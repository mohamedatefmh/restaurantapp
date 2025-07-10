# 🚀 دليل النشر | Deployment Guide

دليل شامل لنشر موقع مطاعم مصر على منصات مختلفة.

A comprehensive guide for deploying the Egyptian Restaurants website on various platforms.

## 📋 المتطلبات | Prerequisites

- حساب GitHub
- معرفة أساسية بـ Git
- متصفح ويب حديث

## 🌐 خيارات النشر | Deployment Options

### 1. GitHub Pages (مجاني | Free)

#### الخطوات | Steps:

1. **Push your code to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Enable GitHub Pages**
   - اذهب إلى إعدادات المستودع | Go to repository settings
   - ابحث عن "Pages" في القائمة الجانبية | Find "Pages" in sidebar
   - اختر "Deploy from a branch" | Select "Deploy from a branch"
   - اختر فرع "main" | Choose "main" branch
   - اختر مجلد "/ (root)" | Select "/ (root)" folder
   - اضغط "Save" | Click "Save"

3. **Your site will be available at:**
   ```
   https://mohamedatefmh.github.io/restaurantapp/
   ```

### 2. Netlify (مجاني | Free)

#### الخطوات | Steps:

1. **Sign up for Netlify**
   - اذهب إلى | Go to https://netlify.com
   - سجل حساب جديد | Sign up for a new account

2. **Deploy from Git**
   - اضغط "New site from Git" | Click "New site from Git"
   - اختر GitHub | Choose GitHub
   - اختر مستودعك | Select your repository
   - اضغط "Deploy site" | Click "Deploy site"

3. **Custom domain (اختياري | Optional)**
   - اذهب إلى إعدادات الموقع | Go to site settings
   - ابحث عن "Domain management" | Find "Domain management"
   - أضف نطاقك المخصص | Add your custom domain

### 3. Vercel (مجاني | Free)

#### الخطوات | Steps:

1. **Sign up for Vercel**
   - اذهب إلى | Go to https://vercel.com
   - سجل حساب جديد | Sign up for a new account

2. **Import your project**
   - اضغط "New Project" | Click "New Project"
   - اختر GitHub | Choose GitHub
   - اختر مستودعك | Select your repository
   - اضغط "Deploy" | Click "Deploy"

### 4. Firebase Hosting (مجاني | Free)

#### الخطوات | Steps:

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase**
   ```bash
   firebase login
   ```

3. **Initialize Firebase**
   ```bash
   firebase init hosting
   ```

4. **Deploy**
   ```bash
   firebase deploy
   ```

## 🔧 إعدادات مخصصة | Custom Configuration

### إعدادات GitHub Pages | GitHub Pages Settings

```yaml
# .github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./
```

### إعدادات Netlify | Netlify Configuration

```toml
# netlify.toml
[build]
  publish = "."
  command = ""

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

## 🌍 النطاقات المخصصة | Custom Domains

### إضافة نطاق مخصص | Adding Custom Domain

1. **شراء نطاق** | Purchase a domain
   - Namecheap, GoDaddy, أو أي مزود آخر | or any other provider

2. **تكوين DNS** | Configure DNS
   ```
   Type: CNAME
   Name: www
   Value: your-site.netlify.app
   ```

3. **إضافة النطاق في منصة النشر** | Add domain in deployment platform
   - اتبع إرشادات المنصة | Follow platform instructions

## 📱 تحسين الأداء | Performance Optimization

### تحسين الصور | Image Optimization

```html
<!-- استخدم صور WebP مع fallback -->
<picture>
  <source srcset="image.webp" type="image/webp">
  <img src="image.jpg" alt="Description">
</picture>
```

### تحسين CSS/JS | CSS/JS Optimization

```html
<!-- Minify CSS and JS -->
<link rel="stylesheet" href="css/style.min.css">
<script src="js/main.min.js"></script>
```

### تحسين التحميل | Loading Optimization

```html
<!-- Lazy loading for images -->
<img src="image.jpg" loading="lazy" alt="Description">

<!-- Preload critical resources -->
<link rel="preload" href="css/style.css" as="style">
<link rel="preload" href="js/main.js" as="script">
```

## 🔒 الأمان | Security

### إعدادات HTTPS | HTTPS Configuration

- معظم منصات النشر تدعم HTTPS تلقائياً | Most platforms support HTTPS automatically
- تأكد من تفعيل HTTPS | Ensure HTTPS is enabled

### حماية المحتوى | Content Security

```html
<!-- Content Security Policy -->
<meta http-equiv="Content-Security-Policy" content="default-src 'self'">
```

## 📊 المراقبة | Monitoring

### Google Analytics | Google Analytics

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### أدوات المراقبة الأخرى | Other Monitoring Tools

- **Google Search Console** - لتحسين SEO | for SEO optimization
- **Lighthouse** - لتحليل الأداء | for performance analysis
- **WebPageTest** - لاختبار السرعة | for speed testing

## 🚨 استكشاف الأخطاء | Troubleshooting

### مشاكل شائعة | Common Issues

1. **الصفحة لا تظهر** | Page not loading
   - تحقق من إعدادات النشر | Check deployment settings
   - تأكد من صحة المسارات | Verify file paths

2. **الصور لا تظهر** | Images not loading
   - تحقق من مسارات الصور | Check image paths
   - تأكد من رفع الصور | Ensure images are uploaded

3. **مشاكل في التصميم المتجاوب** | Responsive design issues
   - اختبر على أجهزة مختلفة | Test on different devices
   - تحقق من CSS media queries | Check CSS media queries

## 📞 الدعم | Support

إذا واجهت أي مشاكل في النشر، يمكنك:

If you encounter any deployment issues, you can:

- **GitHub Issues**: أنشئ issue في المستودع | Create an issue in the repository
- **Documentation**: راجع وثائق المنصة | Check platform documentation
- **Community**: اسأل في مجتمعات المطورين | Ask in developer communities

---

**Happy Deploying! 🎉** 