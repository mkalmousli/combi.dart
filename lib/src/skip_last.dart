import 'package:combi/combi.dart';

class SkipLast<A, B> extends Parser<A> {
  final Parser<A> a;
  final Parser<B> b;
  SkipLast(this.a, this.b);

  @override
  Result<A> parse(String input) {
    final result = (a, b).toParser().parse(input);
    return switch (result) {
      Success<(A, B)>() => Success(result.output.$1, result.rest),
      Failure<(A, B)>() => Failure(result.message),
    };
  }
}
