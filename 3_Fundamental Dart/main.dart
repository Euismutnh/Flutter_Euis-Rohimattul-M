import 'dart:io';
import 'persegi.dart';
import 'persegi panjang.dart';

void main() {
  print('Selamat datang di bahasa pemrogramman dart');
  print(
      'Mari kita menghitung Luas dan keliling dari persegi dan persegi panjang');
  stdout.write("Masukkan panjang sisi persegi: ");
  double sisiPersegi = double.parse(stdin.readLineSync()!);

  Persegi persegi = Persegi(sisiPersegi);
  print("Persegi:");
  print("Luas: ${persegi.hitungLuas()}");
  print("Keliling: ${persegi.hitungKeliling()}");

  stdout.write("\nMasukkan panjang dan lebar persegi panjang : ");
  List<String> inputPersegiPanjang = stdin.readLineSync()!.split(" ");
  double panjangPersegiPanjang = double.parse(inputPersegiPanjang[0]);
  double lebarPersegiPanjang = double.parse(inputPersegiPanjang[1]);

  PersegiPanjang persegiPanjang =
      PersegiPanjang(panjangPersegiPanjang, lebarPersegiPanjang);
  print("\nPersegi Panjang:");
  print("Luas: ${persegiPanjang.hitungLuas()}");
  print("Keliling: ${persegiPanjang.hitungKeliling()}");

  // Ini cara agar user bisa menginputkan hasil yang diinginkan dengan menggunakan fungsi int.parse(stdin.readLineSync()!);
}
