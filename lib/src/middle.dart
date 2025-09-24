import 'package:combi/combi.dart';

class Middle<A, B, C> extends Parser<B> {
  final Parser<A> a;
  final Parser<B> b;
  final Parser<C> c;
  Middle(this.a, this.b, this.c);

  @override
  Result<B> parse(String input) {
    final result = (a, b, c).toParser().parse(input);
    return switch (result) {
      Success<(A, B, C)>() => Success(result.output.$2, result.rest),
      Failure<(A, B, C)>() => Failure(result.message),
    };
  }
}
