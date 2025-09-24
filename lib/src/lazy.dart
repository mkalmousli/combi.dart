import 'package:combi/combi.dart';

// ignore: camel_case_types
typedef lazy<T> = Lazy<T>;

class Lazy<T> extends Parser<T> {
  final Parser<T> Function() parser;
  Lazy(this.parser);

  @override
  Result<T> parse(String input) {
    return parser().parse(input);
  }
}
