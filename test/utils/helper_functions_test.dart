import 'package:test/test.dart';

void main() {
  group("untested", () {
    test('notest', () {});
  });
}

void group(String s, Null Function() param1) {}
