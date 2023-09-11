import 'matematika.dart';

class KelipatanPersekutuanTerbesar extends Matematika {
  KelipatanPersekutuanTerbesar(int x, int y) : super(x, y);

  @override
  int hasil() {
    return gcd(x, y);
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
