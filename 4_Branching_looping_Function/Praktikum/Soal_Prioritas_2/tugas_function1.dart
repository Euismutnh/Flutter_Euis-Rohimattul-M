import 'dart:io';

double luasLingkaran(double jariJari) {
  return 3.14 * jariJari * jariJari;
}

void main() {
  bool lanjut = true;

  while (lanjut) {
    stdout.write("Masukkan jari-jari lingkaran: ");
    double jariJari = double.parse(stdin.readLineSync() ?? '0');

    double luas = luasLingkaran(jariJari);
    print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");

    stdout.write("Ingin menghitung lagi? (y/n): ");
    String jawaban = stdin.readLineSync()?.toLowerCase() ?? '';
    if (jawaban != 'y') {
      lanjut = false;
    }
  }
}
