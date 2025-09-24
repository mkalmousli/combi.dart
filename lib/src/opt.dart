import 'package:combi/combi.dart';

Opt<O> opt<O>(Parser<O> parser) => Opt(parser);

class Opt<O> extends Parser<O?> {
  final Parser<O> parser;
  Opt(this.parser);

  @override
  Result<O?> parse(String input) {
    final result = parser.parse(input);

    switch (result) {
      case Success<O>():
        return result;

      case Failure<O>():
        return Success(null, input);
    }
  }
}
