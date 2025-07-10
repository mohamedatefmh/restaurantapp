@echo off
echo ========================================
echo Setting up Git for Restaurant App
echo ========================================

echo.
echo 1. Initializing Git repository...
git init

echo.
echo 2. Adding all files to Git...
git add .

echo.
echo 3. Making initial commit...
git commit -m "Initial commit: Egyptian Restaurants Guide website"

echo.
echo 4. Adding remote repository...
git remote add origin https://github.com/mohamedatefmh/restaurantapp.git

echo.
echo 5. Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ========================================
echo Setup complete!
echo ========================================
echo.
echo Your project has been pushed to:
echo https://github.com/mohamedatefmh/restaurantapp.git
echo.
echo Next steps:
echo 1. Visit your GitHub repository
echo 2. Enable GitHub Pages if you want to host the site
echo 3. Share your project with others!
echo.
pause 