1. MVVM adalah arsitektur perangkat lunak yang memisahkan logika bisnis (Model) dari tampilan (View) dan tindakan pengguna (ViewModel). Dan MVVM ini berguna untuk memisahkan kode logika bisnis dari tampilan, meningkatkan pemeliharaan dan pengembangan. Serta menjadi Pengelolaan State yaitu memisahkan state aplikasi dari antarmuka pengguna untuk memudahkan pengelolaan state dan pengujian.
2. Model: Representasi dari data dan logika bisnis aplikasi.
Proses: Menangani operasi data dan menyediakan antarmuka untuk mengakses dan memanipulasi data.
3. ViewModel: Bertindak sebagai perantara antara Model dan View, menangani logika presentasi dan state.
Proses:
- Mengamati Model: Memantau perubahan dalam Model.
- Memanipulasi Data: Menyediakan metode untuk memanipulasi data sebelum ditampilkan di View.
- Memperbarui Model: Mengirimkan pembaruan ke Model berdasarkan tindakan pengguna di View.
4. View: Menangani tampilan antarmuka pengguna.
Proses: Menampilkan data dari ViewModel dan memberikan umpan balik pengguna ke ViewModel.
5. Struktur Direktori MVVM:
- model/: Direktori untuk menyimpan kelas Model.
- model_api/: Direktori untuk menyimpan kelas yang berhubungan dengan akses data dari API.
- view/: Direktori untuk menyimpan tampilan (widget Flutter).
- viewmodel/: Direktori untuk menyimpan kelas-kelas ViewModel.
6. Mendaftarkan ViewModel:
- menggunakan multiprovider pada main.dart agar dapat mengakses banyak ViewModel
- MaterialApp sebagai child utama
