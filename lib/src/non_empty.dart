import 'package:combi/combi.dart';

class NonEmpty<T> extends Parser<T> {
  final Parser<T> _parser;
  NonEmpty(this._parser);

  @override
  Result<T> parse(String input) {
    if (input.isEmpty) {
      return Result.failure("Input is empty");
    }

    return _parser.parse(input);
  }
}
