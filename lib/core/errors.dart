class Failure implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const Failure(this.message, {this.cause, this.stackTrace});

  @override
  String toString() => 'Failure(message: ' + message + ', cause: ' + (cause?.toString() ?? 'none') + ')';
}


