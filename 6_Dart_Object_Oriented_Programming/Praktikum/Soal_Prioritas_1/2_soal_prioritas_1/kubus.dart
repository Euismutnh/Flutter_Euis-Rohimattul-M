import 'bangun_ruang.dart';

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return sisi * sisi * sisi;
  }

  double volumeKubus() {
    return super.volume();
  }
}
