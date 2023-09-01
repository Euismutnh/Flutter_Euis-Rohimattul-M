class DataMahasiswa {
  // Properti untuk menyimpan data dalam bentuk list berisi sublist [int, String]
  List<List<dynamic>> dataList = [
    [1, 'Euis'],
    [2, 'Alamat di Pesawaran'],
    [3, 'Usia 21 tahun'],
  ];

  // Properti untuk menyimpan hasil pemrosesan dalam bentuk map [int, String]
  Map<int, String> dataMap = {};

  void processData() {
    // Menggunakan forEach untuk iterasi melalui setiap elemen dataList
    dataList.forEach((element) {
      int key = element[0]; // Mengambil elemen pertama sebagai kunci
      String value = element[1]; // Mengambil elemen kedua sebagai nilai
      dataMap[key] =
          value; // Menyimpan nilai dalam dataMap dengan kunci yang sesuai
    });
  }

  void printDataMap() {
    dataMap.forEach((key, value) {
      print('$key. $value');
    });
  }
}

void main() {
  // Membuat objek DataProcessor
  DataMahasiswa mahasiswa = DataMahasiswa();
  mahasiswa.processData();
  mahasiswa.printDataMap();
}
