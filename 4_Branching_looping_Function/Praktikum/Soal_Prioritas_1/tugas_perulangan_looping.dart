void main() {
  print("Menampilkan nilai 1 - 10 dengan break:");
  for (int i = 1; i <= 10; i++) {
    if (i == 9) {
      break; // Menandakan jika nilai sama dengan 9 maka program akan berhenti atau dengan kata lain program akan berhenti di nilai 8
    }
    print(i);
  }

  print("\nMenampilkan nilai 1 - 10 dengan continue:");
  for (int i = 1; i <= 10; i++) {
    if (i == 4 || i == 9) {
      continue; // Menandakan jika nilai sama dengan 4 atau 9, maka kedua nilai tersebut akan dilewati dan melanjutkan untuk mengevaluasi nilai berikutnya
    }
    print(i);
  }
}
