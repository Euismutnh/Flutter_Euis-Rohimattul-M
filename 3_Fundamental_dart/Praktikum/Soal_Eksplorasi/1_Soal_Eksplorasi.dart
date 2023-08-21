import 'dart:io';

void main() {
  bool continueLoop = true;

  while (continueLoop) {
    print("Masukkan kata atau ketik 'exit' untuk keluar program:");
    String input = stdin.readLineSync()!.toLowerCase();

    if (input == "exit") {
      print("Anda Telah Keluar dari Program");
      break;
    }

    if (isPalindrom(input)) {
      print("Palindrom");
    } else {
      print("Bukan Palindrom");
    }

    stdout.write("Apakah ingin memeriksa kata lagi? (ya/tidak): ");
    String pilihan = stdin.readLineSync()!.toLowerCase();
    if (pilihan != "ya") {
      print("Anda Telah Keluar dari Program");
      break;
    }
  }
}

bool isPalindrom(String kata) {
  String rujukanKata = kata.split('').reversed.join('');
  return kata == rujukanKata;
}
