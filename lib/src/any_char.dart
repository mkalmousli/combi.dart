import 'package:combi/combi.dart';

final anyChar = NonEmpty(
  newParser((input) {
    return Result.success(input[0], input.substring(1));
  }),
);
