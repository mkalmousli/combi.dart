import 'package:combi/combi.dart';

Alt<T> alt<T>(List<Parser<T>> parsers) => Alt(parsers);

class Alt<T> extends Parser<T> {
  final List<Parser<T>> parsers;

  Alt(this.parsers);

  @override
  Result<T> parse(String input) {
    late Result<T> result;

    for (var parser in parsers) {
      result = parser.parse(input);

      // If the parser succeeds, return the success result
      if (result is Success<T>) {
        return result;
      }
    }

    // If all parsers fail, return the failure of the last one
    return Result.failure("No parsers matched out of ${parsers.length}");
  }
}
