import 'dart:io';

Future<void> main() async {
  while (true) {
    List<double> nilai = await inputNilai();

    if (nilai.isEmpty) {
      print('Tidak ada nilai yang dimasukkan.');
      return;
    }

    double rataRata = calculateAverage(nilai);

    printResult(nilai, rataRata);

    if (!ulangiPerhitungan()) {
      break;
    }
  }
}

Future<List<double>> inputNilai() async {
  List<double> nilai = [];

  print('Masukkan hingga 8 nilai (ketik 0 untuk mengakhiri):');

  for (int i = 0; i < 8; i++) {
    stdout.write('Nilai ke-${i + 1}: ');
    double? nilaiInput = double.tryParse(stdin.readLineSync() ?? '');

    if (nilaiInput == null) {
      print('Input tidak valid. Masukkan angka.');
      i--;
    } else if (nilaiInput == 0) {
      break;
    } else {
      nilai.add(nilaiInput);
    }
  }

  return nilai;
}

double calculateAverage(List<double> values) {
  if (values.isEmpty) return 0.0;

  double sum = values.reduce((a, b) => a + b);
  double average = sum / values.length;

  return average;
}

void printResult(List<double> nilai, double rataRata) {
  print('Nilai: $nilai');
  print('Rata-rata: ${rataRata.ceil()}');
}

bool ulangiPerhitungan() {
  stdout.write('Apakah Anda ingin melakukan perhitungan lagi? (y/n): ');
  return (stdin.readLineSync() ?? '').toLowerCase() == 'y';
}
