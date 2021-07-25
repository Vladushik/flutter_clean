import 'dart:math';

void main() {
  Random random = new Random();
  int a = random.nextInt(100);
  int b = random.nextInt(100);
  int c = random.nextInt(100);

  sumDigits(a, b, c);
}

void sumDigits(int a, int b, int c) {
  print('a - $a');
  print('b - $b');
  print('c - $c');
  if (a > b && a > c) {
    print(a);
  } else if (b > a && b > c) {
    print(b);
  } else {
    print(c);
  }
}
