import 'matematika.dart';

class KelipatanPersekutuanTerkecil extends Matematika {
  KelipatanPersekutuanTerkecil(int x, int y) : super(x, y);

  @override
  int hasil() {
    return lcm(x, y);
  }

  int lcm(int a, int b) {
    return (a * b) ~/ gcd(a, b);
  }

  int gcd(int a, int b) {
    while (b != 0) {
      int remainder = a % b;
      a = b;
      b = remainder;
    }
    return a;
  }
}
