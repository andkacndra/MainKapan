# MainKapan

Aplikasi web sederhana untuk booking lapangan futsal dan badminton. Node.js/Express melayani API dan frontend statis, dengan MySQL sebagai penyimpanan data.

## Akun demo

- Admin: email dari `admin@example.com`, password dari `Admin123!`
- Pengguna: `demo@example.com`, password dari `Demo123!`

## Menjalankan lokal

```bash
cp .env.example .env
docker compose up -d --build
docker compose ps
```

Buka `http://localhost:8080`. Edit `.env` dan gunakan secret yang aman sebelum deployment. Jangan commit `.env`.
