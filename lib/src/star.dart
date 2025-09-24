import 'package:combi/combi.dart';

class Star<T> extends Parser<List<T>> {
  final Parser<T> parser;
  Star(this.parser);

  @override
  Result<List<T>> parse(String input) {
    final results = <T>[];

    main_loop:
    while (true) {
      final result = parser.parse(input);

      switch (result) {
        case Success<T> success:
          results.add(success.output);
          input = success.rest;
        case Failure<T>():
          break main_loop;
      }
    }

    return Success(results, input);
  }
}
