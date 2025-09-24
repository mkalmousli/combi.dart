import 'package:combi/combi.dart';

Parser<String> char(String matchChar) => NonEmpty(
  newParser((input) {
    // Check if the first character matches the specified matchChar
    final char = input[0];
    if (char == matchChar) {
      return Success(char, input.substring(1));
    }

    return Failure('Expected character: $matchChar');
  }),
);
