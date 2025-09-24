sealed class Result<O> {
  const Result._();

  const factory Result.success(O output, String rest) = Success<O>;
  const factory Result.failure([String? message]) = Failure<O>;
}

final class Success<O> extends Result<O> {
  final O output;
  final String rest;
  const Success(this.output, this.rest) : super._();

  @override
  String toString() => 'Success(output: $output, rest: "$rest")';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Success<O> && other.output == output && other.rest == rest;
  }

  @override
  int get hashCode => Object.hash(output, rest);
}

final class Failure<O> extends Result<O> {
  final String? message;

  const Failure([this.message]) : super._();

  @override
  String toString() => 'Failure(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure<O> && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
