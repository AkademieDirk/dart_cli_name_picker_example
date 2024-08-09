import 'dart:io';
import 'dart:math' as math;

int getRandomParticipantIndex(List<String> names) {
  if (names.isEmpty) return -1;

  final chosenIndex = math.Random().nextInt(names.length);
  return chosenIndex;
}

/// Shows a small text and waits for user input.
/// To send user input, Enter should be pressed.
String getUserMenuSelection() {
  String selection = "";

  stdout.write("Eingabe: ");
  selection = stdin.readLineSync() ?? "";

  return selection;
}
