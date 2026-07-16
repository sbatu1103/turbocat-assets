# TurboCat — GitHub'a deploy betigi (logo + metadata + site)
# Kullanim:  .\deploy.ps1 -User <github_kullanici_adin>
# Yapar: <GITHUB_USER> yerini doldurur, git init + commit eder.
# Yapamaz: GitHub repo olusturma + push (web'den sen yapacaksin) — adimlari yazar.

param(
  [Parameter(Mandatory=$true)]
  [string]$User
)

$ErrorActionPreference = "Stop"
$dir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 1) <GITHUB_USER> yerine gercek kullanici adini yaz
$metaPath = Join-Path $dir "metadata.json"
$htmlPath = Join-Path $dir "index.html"
(Get-Content $metaPath) -replace '<GITHUB_USER>', $User | Set-Content $metaPath
(Get-Content $htmlPath) -replace '<GITHUB_USER>', $User | Set-Content $htmlPath
Write-Host "[1/3] <GITHUB_USER> -> $User  (metadata.json + index.html)" -ForegroundColor Green

# 2) Git init + commit
Set-Location $dir
git init -q
git config user.email "${User}@users.noreply.github.com"
git config user.name "${User}"
git add -A
git commit -q -m "Turbocat assets + landing site"
git branch -M main
Write-Host "[2/3] Git local repo hazir (commit: main)" -ForegroundColor Green

# 3) Sonraki adimlar (web'den sen)
Write-Host ""
Write-Host "[3/3] SIRA SENDE - sunlari uygula:" -ForegroundColor Yellow
Write-Host "  1) GitHub'da PUBLIC repo ac:  https://github.com/new  - isim: turbocat-assets"
Write-Host "  2) Bu klasorde su komutlari calistir:"
Write-Host "       git remote add origin https://github.com/${User}/turbocat-assets.git"
Write-Host "       git push -u origin main"
Write-Host "  3) Repo - Settings - Pages - Source: Deploy from a branch - Branch: main / root - Save"
Write-Host "  4) 1-2 dk sonra URL'leri test et (hepsi 200 olmali):"
Write-Host "       Logo:   https://cdn.jsdelivr.net/gh/${User}/turbocat-assets@main/turbocat.svg"
Write-Host "       Meta:   https://cdn.jsdelivr.net/gh/${User}/turbocat-assets@main/metadata.json"
Write-Host "       Site:   https://${User}.github.io/turbocat-assets/"
