import 'package:dart_cli_name_picker_example/utils/example_names.dart';
import 'package:dart_cli_name_picker_example/utils/helper_functions.dart';

List<String> unchosenParticipants = [];
List<String> alreadyPickedParticipants = [];

void main() {
  bool isProgramRunning = true;

  /// Set participants that can be chosen to a list of example names.
  unchosenParticipants.addAll(exampleParticipants);

  while (isProgramRunning) {
    print("");
    print("Welche Aktion möchtest du machen? (Mit \"Enter\" bestätigen)");
    print("Nächsten Teil(n)ehmer auswählen, "
        "Offene/Ausgewählte Teilnehmer anzei(g)en, "
        "Ausgewählte zu(r)ücksetzen, (b)eenden");
    String userMenuSelection = getUserMenuSelection();

    if (userMenuSelection == "n" || userMenuSelection == "N") {
      final String? nextParticipant = selectNextParticipant();

      print("");
      if (nextParticipant != null) {
        print("Als nächstes dran ist: $nextParticipant");
      } else {
        print("Alle Teilnehmer waren schon dran \\o/");
      }
    } else if (userMenuSelection == "r" || userMenuSelection == "R") {
      resetAllParticipants();

      print("");
      print("Teilnehmerauswahl wurde zurückgesetzt.");
    } else if (userMenuSelection == "g" || userMenuSelection == "G") {
      print("");
      print("Noch Offene Teilnehmer: $unchosenParticipants");
      print("Schon ausgewählte Teilnehmer: $alreadyPickedParticipants");
      print("");
    } else if (userMenuSelection == "b" || userMenuSelection == "B") {
      isProgramRunning = false;

      print("");
      print("Auf Wiedersehen");
    } else {
      print("");
      print("Bitte eine mögliche Aktion wählen (n/N, r/R, g/G, b/B)");
    }
  }
}

String? selectNextParticipant() {
  if (unchosenParticipants.isNotEmpty) {
    final int nextParticipantIndex =
        getRandomParticipantIndex(unchosenParticipants);
    final String nextParticipant = unchosenParticipants[nextParticipantIndex];

    unchosenParticipants.removeAt(nextParticipantIndex);
    alreadyPickedParticipants.add(nextParticipant);
    return nextParticipant;
  } else {
    return null;
  }
}

void resetAllParticipants() {
  alreadyPickedParticipants.clear();
  unchosenParticipants.clear();
  unchosenParticipants.addAll(exampleParticipants);
}
