import 'dart:io';

void main() {
  print("==================================");
  print("|   Tabel Penilaian Mahasiswa    |");
  print("==================================");
  print("| No |    Nilai     |   Hasil    |");
  print("==================================");

  for (int i = 1; i <= 5; i++) {
    stdout.write("| $i  | ");
    int nilai = int.parse(stdin.readLineSync() ?? '0');

    String hasil = "";

    if (nilai > 70) {
      hasil = "Nilai A";
    } else if (nilai > 40) {
      hasil = "Nilai B";
    } else if (nilai > 0) {
      hasil = "Nilai C";
    } else {
      hasil = "       ";
    }

    print("      ___________________________|");
    print("|    | $nilai           | $hasil    |");
    print("==================================");
  }
}
