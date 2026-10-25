# Reservasi Lapangan

Aplikasi web sederhana untuk booking lapangan futsal dan badminton. Node.js/Express melayani API dan frontend statis, dengan MySQL sebagai penyimpanan data.

## Akun demo

- Admin: email dari `ADMIN_EMAIL`, password dari `ADMIN_PASSWORD`
- Pengguna: `demo@example.com`, password dari `DEMO_PASSWORD`

## Menjalankan lokal

```bash
cp .env.example .env
docker compose up -d --build
docker compose ps
```

Buka `http://localhost:8080`. Edit `.env` dan gunakan secret yang aman sebelum deployment. Jangan commit `.env`.

## Deploy Azure VM Ubuntu

1. Buat VM Ubuntu, lalu pada Network Security Group buka inbound TCP port **80**.
2. Instal Docker Engine dan Compose plugin mengikuti dokumentasi Docker untuk Ubuntu.
3. Clone repository, masuk ke direktori proyek, lalu buat konfigurasi: `cp .env.example .env` dan isi semua secret.
4. Jalankan `docker compose up -d --build`, lalu buka IP publik VM di browser.

## Pengujian operasional

```bash
docker compose ps
docker compose down
docker compose up -d
docker stop <nama_container>
```

Uji persistensi: daftar akun dan buat reservasi, jalankan `docker compose down` lalu `docker compose up -d`; akun dan data harus tetap ada karena volume `mysqldata`. Uji keamanan: `docker compose config` menunjukkan hanya app yang memiliki port publish; database hanya dapat diakses dari network internal. Uji restart: hentikan salah satu container dengan perintah di atas; kebijakan `unless-stopped` akan menyalakannya kembali.
