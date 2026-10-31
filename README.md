# CineLog - Movie Explorer & Watchlist Journal 🎬

Aplikasi mobile Flutter untuk mencari katalog film terkini dan mengelola jurnal tontonan pribadi secara interaktif. Dibuat untuk memenuhi kriteria penugasan UTS Pemrograman Mobile.

## 👤 Identitas Mahasiswa
* **Nama:** Gede Ananda Karunia Putra
* **NIM:** 2455011010
* **Kelas:** D4 TRPL (Teknologi Rekayasa Perangkat Lunak)
* **Mata Kuliah:** Pemrograman Mobile
* **Dosen Pengampu:** Dr. Ir. I Ketut Resika Arthana, S.T., M.Kom.
* **Teaching Assistant:** Made Yuda Sadewa, S.Pd.

---

## 🚀 Fitur Utama
1. **Home / Dashboard:** Menampilkan film trending terkini minggu ini dari TMDB API.
2. **Movie Catalog & Search:** Katalog film dengan fitur pencarian judul film secara real-time.
3. **Movie Detail:** Menampilkan informasi detail film, poster, rating, dan sinopsis.
4. **Add Watchlist (Create):** Form validasi untuk menambah film ke jurnal tontonan personal.
5. **Edit Watchlist (Update):** Form pembaruan status tontonan, rating pribadi, dan ulasan catatan.
6. **My Watchlist & Profile (Read & Delete):** Menampilkan daftar jurnal tersimpan dari Supabase database, fitur hapus dengan konfirmasi dialog, dan info profil mahasiswa.

---

## 🛠️ Tech Stack & Integration
* **Framework:** Flutter (Dart SDK)
* **State Management:** Provider (`ChangeNotifierProvider`)
* **REST API:** TMDB (The Movie Database API) — HTTP GET
* **Backend Database:** Supabase (PostgreSQL) — CRUD Operations
* **UI Utilities:** Google Fonts, CachedNetworkImage, Flutter Rating Bar

---

## 📐 Arsitektur Aplikasi
```text
lib/
├── models/         # MovieModel & WatchlistModel
├── services/       # TmdbApiService & SupabaseService
├── repositories/   # MovieRepository & WatchlistRepository
├── providers/      # MovieProvider & WatchlistProvider
├── screens/        # 6 Main Screens
├── widgets/        # Reusable Custom Widgets
└── main.dart       # App Shell & Entrypoint