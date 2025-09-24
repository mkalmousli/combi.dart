import 'package:combi/src/result.dart';

import 'parser.dart';

Parser<List<String>> takeWhile(bool Function(String value) predicate) =>
    TakeWhileParser(predicate);

class TakeWhileParser extends Parser<List<String>> {
  final bool Function(String value) predicate;
  TakeWhileParser(this.predicate);

  @override
  Result<List<String>> parse(String input) {
    var remaining = input;
    final chars = <String>[];
    while (true) {
      if (remaining.isEmpty) {
        return Success(chars, remaining);
      }

      final char = remaining[0];
      if (predicate(char)) {
        chars.add(char);
        remaining = remaining.substring(1);
      } else {
        return Success(chars, remaining);
      }
    }
  }
}
