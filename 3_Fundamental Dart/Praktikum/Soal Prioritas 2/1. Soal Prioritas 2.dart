void main() {
  String teks = "Saya Lahir pada tangal: ";
  int tanggal = 2;
  String bulan = "Agustus";
  int tahun = 2002;
  double pukul = 17.34;
  String spasi = " ";

  String hasil = teks +
      tanggal.toString() +
      spasi +
      bulan +
      spasi +
      tahun.toString() +
      spasi +
      pukul.toString();
  print(hasil);
}
