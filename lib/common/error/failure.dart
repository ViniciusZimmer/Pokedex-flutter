class Failure implements Exception {
  final String? message;

  Failure({this.message});

  @override
  String toString() {
    if (message == null) return "Failure";
    return "Failure: $message";
  }
}
