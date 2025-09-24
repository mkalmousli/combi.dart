import 'package:combi/combi.dart';

final alpha = Alpha();

class Alpha extends Parser<String> {
  @override
  Result<String> parse(String input) {
    if (input.isEmpty) {
      return Failure('Input is empty');
    }

    // Check if the first character is alphabetic
    final char = input[0];
    if (_isAlpha(char)) {
      return Success(char, input.substring(1));
    }

    return Failure('Expected an alphabetic character');
  }

  bool _isAlpha(String char) {
    // Check if the character is alphabetic (a-z or A-Z)
    final codeUnit = char.codeUnitAt(0);
    return (codeUnit >= 65 && codeUnit <= 90) ||
        (codeUnit >= 97 && codeUnit <= 122); // 'A' to 'Z' or 'a' to 'z'
  }
}
