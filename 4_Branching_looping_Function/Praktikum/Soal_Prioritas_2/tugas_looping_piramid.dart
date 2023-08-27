import 'dart:io';

void main() {
  int jarak, baris;

  stdout.write("Masukan jumlah baris yang diinginkan: ");
  baris = int.parse(stdin.readLineSync() ?? '');

  for (int i = 1, k = 0; i <= baris; ++i, k = 0) {
    for (jarak = 1; jarak <= baris - i; ++jarak) {
      stdout.write("  ");
    }

    while (k != 2 * i - 1) {
      stdout.write("* ");
      ++k;
    }
    print('');
  }
}
