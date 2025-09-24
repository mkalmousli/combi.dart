import 'package:combi/combi.dart';

final eof = Eof();

class Eof extends Parser<String> {
  Eof();

  @override
  Result<String> parse(String input) {
    if (input.isNotEmpty) {
      return Failure('Expected EOF found "$input"!');
    }

    return Success("EOF", "");
  }
}
