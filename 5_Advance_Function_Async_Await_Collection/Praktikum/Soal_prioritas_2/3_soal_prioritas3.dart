import 'dart:io';

Future<void> main() async {
  bool continueLoop = true;

  while (continueLoop) {
    stdout.write(
        "Masukkan sebuah bilangan positif atau ketik 'exit' untuk keluar: ");
    String input = await stdin.readLineSync()!.toLowerCase();

    if (input == 'exit') {
      print("Anda Telah Keluar dari Program");
      break;
    }

    int? bilangan = int.tryParse(
        input); // mengonversi nilai input agar semua bertipe data int

    if (bilangan == null || bilangan < 0) {
      print("Mohon masukkan bilangan positif.");
      continue;
    }

    int faktorial = await hitungFaktorial(bilangan);
    print("Faktorial $bilangan = $faktorial");

    stdout.write("Apakah tetap melanjutkan program? (ya/tidak): ");
    String pilihan = await stdin.readLineSync()!.toLowerCase();
    if (pilihan != "ya") {
      print("Anda Telah Keluar dari Program");
      break;
    }
  }
}

Future<int> hitungFaktorial(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  }
  return n * await hitungFaktorial(n - 1);
}
