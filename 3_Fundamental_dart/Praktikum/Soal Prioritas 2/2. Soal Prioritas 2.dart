import 'dart:math';

double hitungVolumeTabung(double jariJari, double tinggi) {
  return pi * pow(jariJari, 2) * tinggi;
}

void main() {
  print('Mari Kita menghitung Volume Tabung');
  double jariJari = 3.05; // Nilai jari-jari yang telah ditentukan
  double tinggi = 10.0; // Nilai tinggi yang telah ditentukan

  double volume = hitungVolumeTabung(jariJari, tinggi);
  print(
      "Volume tabung dengan jari-jari $jariJari dan tinggi $tinggi adalah $volume");
}
