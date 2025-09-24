import 'package:combi/combi.dart';

class Plus<O> extends Parser<List<O>> {
  final Parser<O> parser;
  Plus(this.parser);

  @override
  Result<List<O>> parse(String input) {
    final result = parser.star().parse(input);

    switch (result) {
      case Success<List<O>> success:
        final results = success.output;
        if (results.isEmpty) {
          return Failure("Expected atleast one match, found none!");
        }
        return Success(success.output, success.rest);

      case Failure<List<O>>():
        return result;
    }
  }
}
