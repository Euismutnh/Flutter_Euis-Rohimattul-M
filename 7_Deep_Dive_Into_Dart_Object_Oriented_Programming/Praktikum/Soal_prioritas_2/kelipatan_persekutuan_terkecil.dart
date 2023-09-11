import 'matematika.dart';

class KelipatanPersekutuanTerkecil extends Matematika {
  KelipatanPersekutuanTerkecil(int x, int y) : super(x, y);

  @override
  int hasil() {
    int hasil = x;
    while (true) {
      if (hasil % x == 0 && hasil % y == 0) {
        return hasil;
      }
      hasil++;
    }
  }
}
