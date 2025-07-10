// Menu Configuration
const menuConfig = {
    ar: {
        restaurants: {
            title: 'المطاعم',
            items: [
                { icon: 'fas fa-utensils', text: 'جميع المطاعم', link: './pages/restaurants.html' },
                { icon: 'fas fa-star', text: 'الأعلى تقييماً', link: './pages/restaurants.html?filter=top-rated' },
                { icon: 'fas fa-fire', text: 'الأكثر شعبية', link: './pages/restaurants.html?filter=popular' },
                { icon: 'fas fa-percent', text: 'العروض الحالية', link: './pages/offers.html' }
            ]
        },
        cuisines: {
            title: 'المطابخ',
            items: [
                { icon: 'fas fa-drumstick-bite', text: 'مصري', link: './pages/restaurants.html?cuisine=egyptian' },
                { icon: 'fas fa-pizza-slice', text: 'إيطالي', link: './pages/restaurants.html?cuisine=italian' },
                { icon: 'fas fa-fish', text: 'بحري', link: './pages/restaurants.html?cuisine=seafood' },
                { icon: 'fas fa-bread-slice', text: 'شرقي', link: './pages/restaurants.html?cuisine=oriental' }
            ]
        },
        account: {
            title: 'حسابي',
            items: [
                { icon: 'fas fa-user', text: 'الملف الشخصي', link: './pages/profile.html' },
                { icon: 'fas fa-heart', text: 'المفضلة', link: './pages/favorites.html' },
                { icon: 'fas fa-star', text: 'تقييماتي', link: './pages/reviews.html' },
                { icon: 'fas fa-cog', text: 'الإعدادات', link: './pages/settings.html' }
            ]
        }
    },
    en: {
        restaurants: {
            title: 'Restaurants',
            items: [
                { icon: 'fas fa-utensils', text: 'All Restaurants', link: './pages/restaurants.html' },
                { icon: 'fas fa-star', text: 'Top Rated', link: './pages/restaurants.html?filter=top-rated' },
                { icon: 'fas fa-fire', text: 'Most Popular', link: './pages/restaurants.html?filter=popular' },
                { icon: 'fas fa-percent', text: 'Current Offers', link: './pages/offers.html' }
            ]
        },
        cuisines: {
            title: 'Cuisines',
            items: [
                { icon: 'fas fa-drumstick-bite', text: 'Egyptian', link: './pages/restaurants.html?cuisine=egyptian' },
                { icon: 'fas fa-pizza-slice', text: 'Italian', link: './pages/restaurants.html?cuisine=italian' },
                { icon: 'fas fa-fish', text: 'Seafood', link: './pages/restaurants.html?cuisine=seafood' },
                { icon: 'fas fa-bread-slice', text: 'Oriental', link: './pages/restaurants.html?cuisine=oriental' }
            ]
        },
        account: {
            title: 'My Account',
            items: [
                { icon: 'fas fa-user', text: 'Profile', link: './pages/profile.html' },
                { icon: 'fas fa-heart', text: 'Favorites', link: './pages/favorites.html' },
                { icon: 'fas fa-star', text: 'My Reviews', link: './pages/reviews.html' },
                { icon: 'fas fa-cog', text: 'Settings', link: './pages/settings.html' }
            ]
        }
    }
};

// Menu Class
class Menu {
    constructor(config) {
        this.config = config;
        this.currentLang = document.documentElement.lang || 'ar';
        this.init();
    }

    init() {
        try {
            this.createMenuStructure();
            this.attachEventListeners();
            this.handleResize();
        } catch (error) {
            console.error('Error initializing menu:', error);
        }
    }

    createMenuStructure() {
        const nav = document.querySelector('.navbar-nav');
        if (!nav) {
            console.error('Navbar element not found');
            return;
        }

        try {
            nav.innerHTML = '';

            // Create main menu items
            Object.entries(this.config[this.currentLang]).forEach(([key, menu]) => {
                const li = document.createElement('li');
                li.className = 'nav-item menu-container';
                li.innerHTML = `
                    <a class="nav-link menu-trigger" href="#" data-menu="${key}">
                        ${menu.title}
                        <i class="fas fa-chevron-down ms-1"></i>
                    </a>
                    <div class="menu-dropdown" data-menu="${key}">
                        ${this.createMenuItems(menu.items)}
                    </div>
                `;
                nav.appendChild(li);
            });
        } catch (error) {
            console.error('Error creating menu structure:', error);
        }
    }

    createMenuItems(items) {
        try {
            return items.map(item => `
                <a href="${item.link}" class="menu-item">
                    <i class="${item.icon} me-2"></i>
                    <span>${item.text}</span>
                </a>
            `).join('');
        } catch (error) {
            console.error('Error creating menu items:', error);
            return '';
        }
    }

    attachEventListeners() {
        try {
            // Toggle menu on click
            document.querySelectorAll('.menu-trigger').forEach(trigger => {
                trigger.addEventListener('click', (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    const menuKey = e.currentTarget.dataset.menu;
                    const dropdown = document.querySelector(`.menu-dropdown[data-menu="${menuKey}"]`);
                    
                    if (!dropdown) return;

                    // Close other menus
                    document.querySelectorAll('.menu-dropdown.show').forEach(menu => {
                        if (menu !== dropdown) {
                            menu.classList.remove('show');
                        }
                    });

                    dropdown.classList.toggle('show');
                });
            });

            // Close menu when clicking outside
            document.addEventListener('click', (e) => {
                if (!e.target.closest('.menu-container')) {
                    document.querySelectorAll('.menu-dropdown.show').forEach(menu => {
                        menu.classList.remove('show');
                    });
                }
            });

            // Handle window resize
            window.addEventListener('resize', this.handleResize.bind(this));
        } catch (error) {
            console.error('Error attaching event listeners:', error);
        }
    }

    handleResize() {
        try {
            const isMobile = window.innerWidth < 992;
            document.querySelectorAll('.menu-dropdown').forEach(menu => {
                if (isMobile) {
                    menu.classList.remove('show');
                }
            });
        } catch (error) {
            console.error('Error handling resize:', error);
        }
    }

    updateLanguage(lang) {
        try {
            this.currentLang = lang;
            this.createMenuStructure();
            this.attachEventListeners();
        } catch (error) {
            console.error('Error updating language:', error);
        }
    }
}

// Initialize menu when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    try {
        window.menu = new Menu(menuConfig);
    } catch (error) {
        console.error('Error initializing menu:', error);
    }
});

// Update menu when language changes
document.addEventListener('languageChanged', (e) => {
    try {
        if (window.menu) {
            window.menu.updateLanguage(e.detail.lang);
        }
    } catch (error) {
        console.error('Error handling language change:', error);
    }
});