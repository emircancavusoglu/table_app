import 'dart:math';
import 'dart:ui';

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256), // Red channel (0-255)
    random.nextInt(256), // Green channel (0-255)
    random.nextInt(256), // Blue channel (0-255)
  );
}
