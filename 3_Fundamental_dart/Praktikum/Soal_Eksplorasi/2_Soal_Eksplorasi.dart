import 'dart:io';

List<int> cariFaktor(int bilangan) {
  List<int> faktor = [];

  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      faktor.add(i);
    }
  }

  return faktor;
}

void main() {
  bool continueLoop = true;

  while (continueLoop) {
    stdout.write(
        "Masukkan sebuah bilangan positif atau ketik 'exit' untuk keluar: ");
    String input = stdin.readLineSync()!.toLowerCase();

    if (input == 'exit') {
      print("Anda Telah Keluar dari Program");
      break;
    }

    int? bilangan = int.tryParse(input);

    if (bilangan == null || bilangan <= 0) {
      print("Mohon masukkan bilangan positif.");
      continue;
    }

    List<int> faktor = cariFaktor(bilangan);

    print("Faktor-faktor dari $bilangan :");
    faktor.forEach((faktor) {
      print(faktor);
    });

    stdout.write("Apakah tetap melanjutkan program? (ya/tidak): ");
    String pilihan = stdin.readLineSync()!.toLowerCase();
    if (pilihan != "ya") {
      print("Anda Telah Keluar dari Program");
      break;
    }
  }
}
