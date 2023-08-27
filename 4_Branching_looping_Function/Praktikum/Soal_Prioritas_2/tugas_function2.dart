void main() {
  var nilai = [10, 40, 50];

  for (int i = 0; i < nilai.length; i++) {
    int faktorial = hitungFaktorial(nilai[i]);
    print("Faktorial ${nilai[i]} = $faktorial");
  }
}

int hitungFaktorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  }
  return n * hitungFaktorial(n - 1);
}
