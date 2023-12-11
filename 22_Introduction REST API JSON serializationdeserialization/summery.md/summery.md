1. REST API: merupakan konsep komunikasi sistem seperti percakapan antara aplikasi, yang memisahkan tampilan dengan proses bisnis
Cara Kerja: Aplikasi Flutter dapat meminta (GET), menambahkan (POST), atau melakukan tindakan lain ke server melalui URL tertentu.

2. HTTP (Hypertext Transfer Protocol): yaitu bahasa standar untuk berkomunikasi di web yang digunakan untuk mengirim data pada internet. Aplikasi membuat permintaan, server memberikan respons.
Cara Kerja: HTTP mengikuti pola komunikasi klien-server. Klien (aplikasi atau perangkat) membuat permintaan, dan server memberikan respons sebagai tanggapan atas permintaan tersebut. Klien mengirimkan permintaan HTTP ke server menggunakan metode seperti GET (mendapatkan data), POST (mengirim data baru), atau PUT (memperbarui data). Server kemudian memberikan respons sesuai permintaan. 
Struktur Request : 
- Url : Menunjukkan alamat atau sumber daya yang akan di minta.
- Metode (Method): Menentukan jenis aksi yang akan dilakukan, seperti GET, POST, PUT, DELETE.
- Header: Berisi informasi tambahan tentang permintaan, seperti tipe konten yang diinginkan atau tipe bahasa.
- Body: Digunakan dalam metode POST atau PUT untuk mengirim data tambahan.

Struktur Respons HTTP:
- Status Code: Menunjukkan apakah permintaan berhasil atau gagal (misalnya, 200 untuk sukses, 404 untuk tidak ditemukan, 500 untuk kesalahan server).
- Header: Memberikan informasi tambahan, seperti tipe konten respons atau tanggal.
- Tubuh (Body): Berisi data yang diminta atau informasi tambahan.

3. Dio (HTTP Package for Flutter):
Dio adalah paket HTTP yang populer dalam ekosistem Flutter, digunakan untuk berkomunikasi dengan REST API. Dio menyediakan antarmuka yang mudah digunakan untuk membuat permintaan HTTP, mengelola respons, dan menangani berbagai aspek komunikasi jaringan.

Cara Kerja Dio:
- Inisialisasi Dio: Dio diinstal sebagai dependensi dan diinisialisasi pada awal aplikasi Flutter.
- Buat Objek Dio: Objek Dio dibuat untuk menangani semua operasi HTTP.
- Buat Permintaan HTTP: Menggunakan metode Dio, seperti dio.get atau dio.post, untuk membuat permintaan ke REST API.
- Kelola Respons: Dio menyediakan mekanisme untuk menangani respons, seperti memeriksa kode status atau mengekstrak data dari respons.
- Intersep Permintaan dan Respons: Dio memungkinkan perekaman atau modifikasi permintaan dan respons dengan menggunakan interceptor.

4. Serialisasi JSON:

Serialisasi JSON: Serialisasi adalah proses mengubah objek atau data struktured ke dalam format JSON. Pada REST API, sering digunakan untuk mengirim data dari klien ke server.

Cara Kerjanya:
- Pemilihan Data(Map/list): Pilih data atau objek yang akan dikirimkan.
- Konversi ke JSON: Ubah data tersebut menjadi format JSON menggunakan metode seperti jsonEncode pada Flutter.
- Kirim ke Server: Kirim data JSON ke server melalui permintaan HTTP, misalnya POST request.
Deserialisasi JSON:

DeserialisasiJSON : adalah proses mengubah data JSON kembali menjadi objek atau struktur data yang dapat digunakan oleh aplikasi.

Cara Kerjanya:
- Terima Respons: Terima respons dari server yang berupa data JSON.
- Konversi ke Objek: Gunakan metode deserialisasi seperti jsonDecode pada Flutter untuk mengubah JSON menjadi objek atau struktur data.
- Gunakan Data: Gunakan data yang telah di-deserialisasi untuk pemrosesan lebih lanjut atau tampilkan ke pengguna.