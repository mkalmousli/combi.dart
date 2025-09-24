import 'package:combi/combi.dart';

ListParser<T> list<T>(List<Parser<T>> parsers) => ListParser(parsers);

class ListParser<T> extends Parser<List<T>> {
  final List<Parser<T>> parsers;

  ListParser(this.parsers);

  @override
  Result<List<T>> parse(String input) {
    List<T> results = [];

    for (var parser in parsers) {
      final result = parser.parse(input);

      switch (result) {
        case Success<T> success:
          results.add(success.output); // Collect the result
          input = success.rest; // Update the remaining input
        case Failure<T>():
          return Failure(result.message);
      }
    }

    return Success(results, input); // Return accumulated results
  }
}
