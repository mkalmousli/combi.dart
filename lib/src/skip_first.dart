import 'package:combi/combi.dart';

class SkipFirst<A, B> extends Parser<B> {
  final Parser<A> a;
  final Parser<B> b;
  SkipFirst(this.a, this.b);

  @override
  Result<B> parse(String input) {
    final result = (a, b).toParser().parse(input);
    return switch (result) {
      Success<(A, B)>() => Success(result.output.$2, result.rest),
      Failure<(A, B)>() => Failure(result.message),
    };
  }
}
