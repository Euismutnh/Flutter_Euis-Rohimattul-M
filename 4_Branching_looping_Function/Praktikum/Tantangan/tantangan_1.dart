import 'dart:io';

class Barang {
  String nama;
  int harga;

  Barang(this.nama, this.harga);
}

void main() {
  List<Barang> daftarBarang = [
    Barang("Buku", 10000),
    Barang("Pensil", 5000),
    Barang("Tas", 100000),
  ];

  List<Barang> belanjaan = [];
  int totalHarga = 0;

  print("Daftar Barang:");
  for (int i = 0; i < daftarBarang.length; i++) {
    print("$i. ${daftarBarang[i].nama} - Rp ${daftarBarang[i].harga}");
  }

  while (true) {
    stdout.write(
        "Pilih barang (0-${daftarBarang.length - 1}), atau -1 untuk selesai: ");
    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == -1) {
      break;
    }

    if (pilihan < 0 || pilihan >= daftarBarang.length) {
      print("Pilihan tidak valid.");
      continue;
    }

    belanjaan.add(daftarBarang[pilihan]);
    totalHarga += daftarBarang[pilihan].harga;
    print("${daftarBarang[pilihan].nama} telah ditambahkan ke keranjang.");
  }

  double diskon = 0.10;
  double totalSetelahDiskon = totalHarga * (1 - diskon);

  print("Isi Keranjang:");
  for (var item in belanjaan) {
    print("${item.nama} - Rp ${item.harga}");
  }

  print("Total Harga Sebelum Diskon: Rp $totalHarga");
  print("Diskon 10%: Rp ${totalHarga * diskon}");
  print("Total Setelah Diskon: Rp $totalSetelahDiskon");
}
