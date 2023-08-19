import 'dart:io';

void main() {
  print('Selamat datang di bahasa pemrogramman dart');

  var a;
  a = 1;
  print(a);

  var b = 2;
  print(b);

  //ini cara agar user bisa menginputkan hasil yang di inginkan dengan menggunakan fungsi int.parse(stdin.readLineSync()!);
  print("Tuliskan angka favorite kamu : ");
  int n = int.parse(stdin.readLineSync()!);
  print("");
}
