import 'dart:io';

void main() {
  stdout.write("Masukkan bilangan pertama (double): ");
  double a = double.parse(stdin.readLineSync() ?? '0');

  stdout.write("Masukkan bilangan kedua (integer): ");
  int b = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  double hasilPenjumlahan = a + b;
  double hasilPengurangan = a - b;
  double hasilPerkalian = a * b;
  double hasilPembagian = (b != 0) ? (a / b) : 0;

  print("Hasil Penjumlahan: $hasilPenjumlahan");
  print("Hasil Pengurangan: $hasilPengurangan");
  print("Hasil Perkalian: $hasilPerkalian");
  print("Hasil Pembagian: $hasilPembagian");
}
