import 'dart:io';
import 'kelipatan_persekutuan_terkecil.dart';
import 'kelipatan_persekutuan_terbesar.dart';

void main() {
  bool lanjut = true;

  while (lanjut) {
    stdout.write("Masukkan nilai x: ");
    int x = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

    stdout.write("Masukkan nilai y: ");
    int y = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

    var operation1 = KelipatanPersekutuanTerkecil(x, y);
    var operation2 = KelipatanPersekutuanTerbesar(x, y);

    print("Hasil Kelipatan Persekutuan Terkecil: ${operation1.hasil()}");
    print("Hasil Kelipatan Persekutuan Terbesar: ${operation2.hasil()}");

    stdout.write("Ingin melanjutkan? (ya/tidak): ");
    String? jawaban = stdin.readLineSync()?.toLowerCase();
    if (jawaban != 'ya') {
      lanjut = false;
    }
  }
}
