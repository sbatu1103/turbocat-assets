# 🚀 Deploy Et — Tek Repo, İki Engel Çözülür

Bu klasördeki 3 dosya (`turbocat.svg`, `metadata.json`, `index.html`) **tek bir public GitHub repo'suna** konulunca:

- ✅ **Logo + metadata** → `cdn.jsdelivr.net/gh/...` ile stabil, bot-dostu URL (Blocker 1 çözülür)
- ✅ **Web sitesi** → GitHub Pages ile `https://<user>.github.io/turbocat-assets/` (Blocker 2 çözülür)

---

## Yöntem A: GitHub Pages (önerilen — tek araç, ücretsiz)

```powershell
cd registry-submissions\assets
.\deploy.ps1 -User <github_kullanici_adin>
```

Betik `<GITHUB_USER>` yerini doldurur ve `git commit` eder. Sonra çıktıdaki adımları uygula:
1. GitHub'da public repo aç (`turbocat-assets`)
2. `git remote add origin ...` + `git push -u origin main`
3. Settings → Pages → branch `main` / `/root`
4. URL'leri test et (hepsi 200 olmalı)

> GitHub kullanıcı adını bilmiyorsan: https://github.com → sağ üstteki ayar → "Your profile" URL'si.

---

## Yöntem B: Cloudflare Pages (alternatif — `turbocat-launch.pages.dev`)

`cloudflared` makinede mevcut, yani Cloudflare hesabın var olabilir.
1. Bu klasördeki `index.html` + `turbocat.svg` + `metadata.json`'u bir GitHub repo'suna koy.
2. Cloudflare Dashboard → Pages → "Connect to Git" → repo'yu seç → Framework: None → Build: (boş) → Deploy.
3. `turbocat-launch.pages.dev` yayınlanır. `external_url` ve site linkini buna güncelle.

Logo için yine jsDelivr (/ Yöntem A'daki repo) kullan — Pages URL'i Cloudflare arkasında olabilir, logo'yu ayrı tut.

---

## Deploy SONRASI

1. URL'lerin 200 döndüğünü doğrula (deploy.ps1 adım 4).
2. `..\/TOKEN_FACTS.md` içindeki şu alanları güncelle:
   - `Logo (stabil):` → jsDelivr SVG URL'i
   - `Metadata (stabil):` → jsDelivr metadata URL'i
   - `Website:` → GitHub Pages URL'i
   - `Twitter / X:` → `@turbocat_sol` (zaten biliniyor)
3. On-chain metadata URI'sini stabil URL'ye güncelle → bak `..\/ONCHAIN_UPDATE.md` (adım B)
4. CoinGecko → CoinMarketCap → Jupiter başvurularını gönder.
