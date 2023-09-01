class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  Kubus(double sisi) : super(sisi, sisi, sisi);
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi)
      : super(panjang, lebar, tinggi);
}

void main() {
  // Membuat objek Kubus
  Kubus kubus = Kubus(5.0);
  print("Volume Kubus: ${kubus.volume()}");

  // Membuat objek Balok
  Balok balok = Balok(3.0, 4.0, 5.0);
  print("Volume Balok: ${balok.volume()}");
}
