import 'package:combi/combi.dart';

Parser<int> digit = NonEmpty(
  newParser((input) {
    // Check if the first character is a digit
    final char = input[0];
    if (_isDigit(char)) {
      return Success(int.parse(char), input.substring(1));
    }

    return Failure('Expected a digit, but found: $char');
  }),
);

bool _isDigit(String char) {
  // Check if the character is a digit (0-9)
  final codeUnit = char.codeUnitAt(0);
  return codeUnit >= 48 && codeUnit <= 57; // '0' to '9'
}
