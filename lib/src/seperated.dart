import 'package:combi/combi.dart';

class Separated<T, S> extends Parser<List<T>> {
  final Parser<T> parser;
  final Parser<S> seperator;
  Separated(this.parser, this.seperator);

  @override
  Result<List<T>> parse(String input) {
    List<T> results = [];

    // Parse the first element
    final firstResult = parser.parse(input);
    if (firstResult is Failure<T>) {
      return Failure(firstResult.message);
    }
    firstResult as Success<T>;

    results.add(firstResult.output);
    input = firstResult.rest;

    // Try parsing subsequent elements with separators
    while (true) {
      final separatorResult = seperator.parse(input);
      if (separatorResult is! Success<S>) {
        break; // If separator isn't found, stop parsing
      }
      final elementInput = separatorResult.rest;

      final elementResult = parser.parse(elementInput);
      if (elementResult is! Success<T>) {
        break; // If an element isn't found after the separator, stop parsing
      }
      results.add(elementResult.output);
      input = elementResult.rest;
    }

    return Success(results, input);
  }
}
