import 'package:combi/combi.dart';

Parser<String> tag(String matchTag) => NonEmpty(
  newParser((input) {
    // Check if the input starts with the specified string
    if (input.startsWith(matchTag)) {
      return Success(matchTag, input.substring(matchTag.length));
    }

    return Failure('Expected string: "$matchTag"');
  }),
);
