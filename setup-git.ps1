# Restaurant App Git Setup Script
Write-Host "========================================" -ForegroundColor Green
Write-Host "Setting up Git for Restaurant App" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

Write-Host ""
Write-Host "1. Initializing Git repository..." -ForegroundColor Yellow
git init

Write-Host ""
Write-Host "2. Adding all files to Git..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "3. Making initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Egyptian Restaurants Guide website"

Write-Host ""
Write-Host "4. Adding remote repository..." -ForegroundColor Yellow
git remote add origin https://github.com/mohamedatefmh/restaurantapp.git

Write-Host ""
Write-Host "5. Pushing to GitHub..." -ForegroundColor Yellow
git branch -M main
git push -u origin main

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Setup complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your project has been pushed to:" -ForegroundColor Cyan
Write-Host "https://github.com/mohamedatefmh/restaurantapp.git" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "1. Visit your GitHub repository" -ForegroundColor White
Write-Host "2. Enable GitHub Pages if you want to host the site" -ForegroundColor White
Write-Host "3. Share your project with others!" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to continue..." 