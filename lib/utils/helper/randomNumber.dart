import 'dart:math';

int generateRandomNumber() {
  const int maxDigits = 6;
  if (maxDigits < 1 || maxDigits > 6) {
    throw ArgumentError('maxDigits must be between 1 and 6');
  }

  // min value for the given number of digits
  int min = pow(10, maxDigits - 1).toInt();

  // max value for the given number of digits
  int max = pow(10, maxDigits).toInt() - 1;

  Random random = Random();
  return min + random.nextInt(max - min + 1);
}