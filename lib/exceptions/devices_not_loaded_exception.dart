
class DevicesNotLoadedException implements Exception {
  final int statusCode;
  DevicesNotLoadedException(this.statusCode);

  @override
  String toString() {
    return "Could not get devices (error code $statusCode)";
  }
}