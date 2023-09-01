import 'dart:io';
import 'kubus.dart';
import 'balok.dart';

void main() {
  double panjang, lebar, tinggi, sisi;

  stdout.write("Masukkan panjang: ");
  panjang = double.parse(stdin.readLineSync()!);

  stdout.write("Masukkan lebar: ");
  lebar = double.parse(stdin.readLineSync()!);

  stdout.write("Masukkan tinggi: ");
  tinggi = double.parse(stdin.readLineSync()!);

  stdout.write("Masukkan sisi untuk kubus: ");
  sisi = double.parse(stdin.readLineSync()!);

  // Membuat objek Kubus
  Kubus kubus = Kubus(sisi);
  print("Volume Kubus: ${kubus.volume()}");

  // Membuat objek Balok
  Balok balok = Balok(panjang, lebar, tinggi);
  print("Volume Balok: ${balok.volume()}");
}
