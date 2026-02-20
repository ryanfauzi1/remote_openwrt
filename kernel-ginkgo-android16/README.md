# Kernel Ginkgo Android 16 Fetcher

Sesuai permintaan, ini disiapkan untuk **ambil repo orang** (kernel Xiaomi ginkgo Android 16) secara otomatis.

## Repo prioritas
Script akan mencoba beberapa kandidat repo publik yang umum dipakai komunitas:
1. `https://github.com/LineageOS/android_kernel_xiaomi_ginkgo.git` (branch `lineage-23.0`)
2. `https://github.com/PixelOS-AOSP/kernel_xiaomi_ginkgo.git` (branch `android-16`)
3. `https://github.com/ProjectMatrixx/android_kernel_xiaomi_ginkgo.git` (branch `16.0`)

> Catatan: Android 16 branch naming berbeda-beda antar maintainer, jadi script mencoba beberapa kombinasi branch otomatis.

## Cara pakai
```bash
cd kernel-ginkgo-android16
bash fetch_kernel_ginkgo_android16.sh
```

Jika berhasil, source akan ada di folder `kernel-source/`.

## Opsi manual
Kalau mau pakai repo lain:
```bash
bash fetch_kernel_ginkgo_android16.sh <repo_url> <branch>
```
Contoh:
```bash
bash fetch_kernel_ginkgo_android16.sh https://github.com/LineageOS/android_kernel_xiaomi_ginkgo.git lineage-23.0
```
