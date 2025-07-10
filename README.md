# مطاعم مصر | Egyptian Restaurants Guide

موقع إلكتروني شامل لتقييم واستكشاف المطاعم في مصر مع دعم اللغتين العربية والإنجليزية.

A comprehensive web platform for discovering and rating restaurants across Egypt with bilingual support (Arabic/English).

## 🌟 المميزات الرئيسية | Key Features

### 🍽️ **Restaurant Discovery**
- 🔍 بحث متقدم عن المطاعم حسب الموقع والنوع والتقييم
- 🗺️ خرائط تفاعلية لمواقع المطاعم
- 📱 تصميم متجاوب مع جميع الأجهزة
- ⭐ نظام تقييم متكامل مع النجوم والتعليقات

### 🌍 **Bilingual Support**
- 🇪🇬 دعم كامل للغة العربية مع اتجاه RTL
- 🇺🇸 دعم كامل للغة الإنجليزية مع اتجاه LTR
- 🔄 تبديل سلس بين اللغتين
- 📝 ترجمة شاملة لجميع المحتويات

### 📱 **User Experience**
- 🎨 تصميم عصري وجذاب
- ⚡ أداء سريع ومحسن
- 🔧 سهولة الاستخدام والتنقل
- 📸 دعم الصور والفيديوهات عالية الجودة

### 👥 **Community Features**
- 📝 تقييمات الفود بلوجرز
- 💬 نظام تعليقات تفاعلي
- 📱 تكامل مع وسائل التواصل الاجتماعي
- 🤝 مشاركة التجارب والآراء

## 🛠️ التقنيات المستخدمة | Technologies Used

### Frontend
- **HTML5** - Semantic markup and structure
- **CSS3** - Modern styling with CSS Grid and Flexbox
- **JavaScript (ES6+)** - Interactive functionality and dynamic content
- **Font Awesome** - Icon library
- **Google Fonts** - Typography (Cairo, Roboto)

### Backend (Planned)
- **PHP (Laravel)** - Server-side framework
- **MySQL** - Database management
- **RESTful APIs** - Data communication

### Development Tools
- **Git** - Version control
- **VS Code** - Code editor
- **Responsive Design** - Mobile-first approach

## 📁 هيكل المشروع | Project Structure

```
المطعم/
├── index.html              # الصفحة الرئيسية
├── restaurants.html        # صفحة المطاعم
├── bloggers.html          # صفحة الفود بلوجرز
├── contact.html           # صفحة التواصل
├── italian-restaurant.html # صفحة مطعم إيطالي نموذجية
├── css/                   # ملفات التنسيق
│   ├── style.css         # التنسيق الرئيسي
│   ├── restaurants.css   # تنسيق صفحة المطاعم
│   ├── bloggers.css      # تنسيق صفحة الفود بلوجرز
│   ├── contact.css       # تنسيق صفحة التواصل
│   └── italian-style.css # تنسيق المطعم الإيطالي
├── js/                    # ملفات الجافا سكريبت
│   ├── main.js           # الوظائف الرئيسية
│   ├── restaurants.js    # وظائف صفحة المطاعم
│   ├── bloggers.js       # وظائف صفحة الفود بلوجرز
│   └── contact.js        # وظائف صفحة التواصل
├── images/               # الصور والرسومات
├── README.md             # ملف المشروع
└── .gitignore           # ملف تجاهل Git
```

## 🚀 التثبيت والتشغيل | Installation & Setup

### المتطلبات | Prerequisites
- متصفح ويب حديث (Chrome, Firefox, Safari, Edge)
- خادم ويب محلي (للتطوير)

### خطوات التثبيت | Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/mohamedatefmh/restaurantapp.git
   cd restaurantapp
   ```

2. **Open in browser**
   - افتح ملف `index.html` في متصفحك
   - أو استخدم خادم ويب محلي مثل Live Server

3. **Development setup**
   ```bash
   # Install Live Server (VS Code extension)
   # Or use Python's built-in server
   python -m http.server 8000
   ```

## 🎯 الاستخدام | Usage

### للمستخدمين | For Users
1. **استكشاف المطاعم**: تصفح قائمة المطاعم المتاحة
2. **البحث**: استخدم شريط البحث للعثور على مطاعم محددة
3. **التقييم**: اقرأ تقييمات المستخدمين والفود بلوجرز
4. **التواصل**: اتصل بالمطاعم أو اترك تعليقك

### للمطورين | For Developers
1. **التطوير**: قم بتعديل الملفات حسب احتياجاتك
2. **إضافة محتوى**: أضف مطاعم جديدة أو صفحات إضافية
3. **التخصيص**: عدّل التصميم والوظائف حسب المتطلبات

## 🔧 التخصيص | Customization

### إضافة مطعم جديد | Adding a New Restaurant
1. أنشئ صفحة HTML جديدة للمطعم
2. أضف التنسيقات المطلوبة في CSS
3. أضف الوظائف التفاعلية في JavaScript
4. اربط الصفحة بالتنقل الرئيسي

### تعديل التصميم | Modifying Design
- عدّل متغيرات CSS في `:root`
- أضف تنسيقات جديدة في ملفات CSS المناسبة
- تأكد من التوافق مع التصميم المتجاوب

## 🤝 المساهمة | Contributing

نرحب بمساهماتكم في تطوير الموقع! يرجى اتباع الخطوات التالية:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
4. **Test thoroughly**
5. **Submit a pull request**

### إرشادات المساهمة | Contribution Guidelines
- اتبع معايير الترميز المتبعة
- تأكد من عمل الموقع على جميع المتصفحات
- اختبر التصميم المتجاوب
- أضف تعليقات توضيحية للكود

## 📝 الترخيص | License

هذا المشروع مرخص تحت رخصة MIT. راجع ملف `LICENSE` للتفاصيل.

This project is licensed under the MIT License. See the `LICENSE` file for details.

## 📞 التواصل | Contact

- **GitHub**: [mohamedatefmh](https://github.com/mohamedatefmh)
- **Email**: [أضف بريدك الإلكتروني هنا]
- **Website**: [رابط الموقع عند النشر]

## 🙏 الشكر والتقدير | Acknowledgments

- شكراً لجميع المساهمين في المشروع
- شكراً لمجتمع المطورين العرب
- شكراً لجميع المطاعم والمستخدمين

---

**Made with ❤️ for the Egyptian restaurant community**