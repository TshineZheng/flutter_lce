class ObjectUtil {
  /// Returns true if the string is null or 0-length.
  static bool isEmptyString(String? str) {
    return str == null || str.isEmpty;
  }

  /// Returns true  String or List or Map is empty.
  static bool isEmpty(Object? object) {
    if (object == null) return true;
    if (object == 'null') return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }

  /// Returns true String or List or Map is not empty.
  static bool isNotEmpty(Object? object) {
    return !isEmpty(object);
  }
}
