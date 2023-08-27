import 'dart:io';

void main() {
  int b, k, c;
  int tinggi;

  stdout.write("Masukkan tinggi baris jam pasir: ");
  tinggi = int.parse(stdin.readLineSync() ?? '');

  for (b = 1; b <= tinggi; b++) {
    for (k = 1; k <= b; k++) {
      stdout.write(" ");
    }
    for (c = tinggi; c >= b; c--) {
      stdout.write("* ");
    }
    print('');
  }

  for (b = tinggi - 1; b >= 1; b--) {
    for (k = 1; k <= b; k++) {
      stdout.write(" ");
    }
    for (c = tinggi; c >= b; c--) {
      stdout.write("* ");
    }
    print('');
  }
}
