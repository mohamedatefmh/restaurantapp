-- إنشاء قاعدة البيانات
CREATE DATABASE IF NOT EXISTS egyptian_restaurants CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE egyptian_restaurants;

-- جدول المستخدمين
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    avatar VARCHAR(255),
    role ENUM('user', 'admin', 'restaurant_owner') DEFAULT 'user',
    points INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- جدول المحافظات
CREATE TABLE governorates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_ar VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- جدول المناطق
CREATE TABLE areas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    governorate_id INT,
    name_ar VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (governorate_id) REFERENCES governorates(id)
);

-- جدول المطاعم
CREATE TABLE restaurants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT,
    name_ar VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    description_ar TEXT,
    description_en TEXT,
    address_ar TEXT,
    address_en TEXT,
    phone VARCHAR(20),
    email VARCHAR(255),
    website VARCHAR(255),
    logo VARCHAR(255),
    cover_image VARCHAR(255),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    area_id INT,
    cuisine_type VARCHAR(100),
    price_range ENUM('low', 'medium', 'high'),
    is_halal BOOLEAN DEFAULT true,
    is_vegetarian BOOLEAN DEFAULT false,
    opening_hours JSON,
    average_rating DECIMAL(3, 2) DEFAULT 0,
    total_reviews INT DEFAULT 0,
    status ENUM('active', 'inactive', 'pending') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (area_id) REFERENCES areas(id)
);

-- جدول صور المطاعم
CREATE TABLE restaurant_images (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    image_url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- جدول القوائم
CREATE TABLE menus (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    name_ar VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    description_ar TEXT,
    description_en TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(100),
    is_available BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- جدول التقييمات
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    restaurant_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    images JSON,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- جدول العروض
CREATE TABLE offers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    title_ar VARCHAR(255) NOT NULL,
    title_en VARCHAR(255) NOT NULL,
    description_ar TEXT,
    description_en TEXT,
    discount_percentage INT,
    start_date DATE,
    end_date DATE,
    conditions TEXT,
    status ENUM('active', 'inactive', 'expired') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- جدول روابط التواصل الاجتماعي
CREATE TABLE social_media_links (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    platform ENUM('facebook', 'twitter', 'instagram', 'youtube', 'tiktok'),
    url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- جدول المفضلة
CREATE TABLE favorites (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    restaurant_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    UNIQUE KEY unique_favorite (user_id, restaurant_id)
);

-- جدول نقاط المستخدم
CREATE TABLE user_points (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    points INT NOT NULL,
    reason VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- إدخال بيانات المحافظات
INSERT INTO governorates (name_ar, name_en) VALUES
('القاهرة', 'Cairo'),
('الجيزة', 'Giza'),
('الإسكندرية', 'Alexandria'),
('الغربية', 'Gharbia'),
('الشرقية', 'Sharqia'),
('المنوفية', 'Monufia'),
('البحيرة', 'Beheira'),
('كفر الشيخ', 'Kafr El Sheikh'),
('المنيا', 'Minya'),
('أسيوط', 'Assiut'),
('سوهاج', 'Sohag'),
('قنا', 'Qena'),
('الأقصر', 'Luxor'),
('أسوان', 'Aswan'),
('البحر الأحمر', 'Red Sea'),
('الوادي الجديد', 'New Valley'),
('شمال سيناء', 'North Sinai'),
('جنوب سيناء', 'South Sinai'),
('بورسعيد', 'Port Said'),
('دمياط', 'Damietta'),
('الإسماعيلية', 'Ismailia'),
('السويس', 'Suez'),
('بني سويف', 'Beni Suef'),
('الفيوم', 'Faiyum');

-- إدخال بيانات المناطق الرئيسية في القاهرة
INSERT INTO areas (governorate_id, name_ar, name_en) VALUES
(1, 'وسط البلد', 'Downtown'),
(1, 'مدينة نصر', 'Nasr City'),
(1, 'المعادي', 'Maadi'),
(1, 'زمالك', 'Zamalek'),
(1, 'مصر الجديدة', 'Heliopolis'),
(1, 'روكسي', 'Roxy'),
(1, 'الزمالك', 'Zamalek'),
(1, 'جاردن سيتي', 'Garden City'),
(1, 'مصر القديمة', 'Old Cairo'),
(1, 'المرج', 'El Marg');