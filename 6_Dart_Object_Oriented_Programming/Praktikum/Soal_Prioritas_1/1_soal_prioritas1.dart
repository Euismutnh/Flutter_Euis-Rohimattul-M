import 'dart:io';

class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  bool tambahMuatan(Hewan hewan) {
    if ((muatanSum() + hewan.berat) <= kapasitas) {
      muatan.add(hewan);
      return true; // Berhasil menambahkan muatan
    } else {
      return false; // Kapasitas penuh, tidak bisa menambahkan muatan lagi
    }
  }

  double muatanSum() {
    return muatan.fold(0, (sum, hewan) => sum + hewan.berat);
  }
}

void main() {
  Mobil mobil = Mobil(1000.0); // Maksimum kapasitas 1000 kg

  List<String> jenisHewan = ["sapi", "kambing"];

  print("Hitung Total Muatan Mobil Fusso");
  print("1. Sapi");
  print("2. Kambing");

  bool lanjut = true;

  while (lanjut) {
    stdout.write("Masukkan jenis hewan yang akan dimuat (1/2): ");
    int pilihan = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

    if (pilihan == 1 || pilihan == 2) {
      stdout.write("Masukkan berat hewan (kg): ");
      double beratHewan = double.parse(stdin.readLineSync() ?? '0');

      Hewan hewan = Hewan(beratHewan);

      if (mobil.tambahMuatan(hewan)) {
        print("${jenisHewan[pilihan - 1].toUpperCase()} berhasil dimuat.");
      } else {
        print(
            "Muatan ${jenisHewan[pilihan - 1]} tidak dapat dimuat karena kapasitas penuh.");
        lanjut = false; // Berhenti jika kapasitas penuh
      }

      print("Total berat muatan saat ini: ${mobil.muatanSum()} kg");

      if (mobil.muatanSum() >= 1000) {
        print("Kapasitas muatan sudah mencapai batas maksimal (1000 kg).");
        lanjut = false; // Berhenti jika kapasitas maksimal tercapai
      } else {
        stdout.write("Ingin melanjutkan? (ya/tidak): ");
        String jawaban = stdin.readLineSync()?.toLowerCase() ?? '';
        if (jawaban != 'ya') {
          lanjut = false; // Berhenti jika pengguna tidak ingin melanjutkan
        }
      }
    } else {
      print("Pilihan jenis hewan tidak valid.");
    }
  }

  print("Muatan mobil sudah maksimal.");
}
