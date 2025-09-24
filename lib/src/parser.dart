import 'package:combi/combi.dart';
import 'package:combi/src/plus.dart';
import 'package:combi/src/star.dart';

abstract class Parser<T> {
  Result<T> parse(String input);

  Star<T> star() => Star(this);
  Plus<T> plus() => Plus(this);

  Opt<T> opt() => Opt(this);

  Parser<R> map<R>(R Function(T value) transform) {
    return _MapOkParser(this, transform);
  }
}

Parser<T> newParser<T>(Result<T> Function(String input) parseFn) =>
    _NewParser(parseFn);

class _NewParser<T> extends Parser<T> {
  final Result<T> Function(String input) parseFn;
  _NewParser(this.parseFn);

  @override
  Result<T> parse(String input) => parseFn(input);
}

class _MapOkParser<T, R> extends Parser<R> {
  final Parser<T> parser;
  final R Function(T value) transform;

  _MapOkParser(this.parser, this.transform);

  @override
  Result<R> parse(String input) {
    // Parse using the original parser
    final result = parser.parse(input);

    return switch (result) {
      Success<T> success => Success(transform(success.output), success.rest),
      Failure<T> failure => Failure(failure.message),
    };
  }
}
