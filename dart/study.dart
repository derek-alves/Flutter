void soma2(int a, int b) {
  print(a + b);
}

int exec(int a, int b, int Function(int, int) fn) {
  return fn(a, b);
}

int soma(int a, int b) {
  return a + b;
}

main() {
  exec(2, 3, (a, b) => a + b);
}
