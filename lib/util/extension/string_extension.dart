extension ValidationStringErrorExtension on String {
  String get isRequired => '$this tidak boleh kosong';
  String get isInvalidFormat => 'Format $this tidak valid';
  String lengthMustBeOrGreaterThan(int data) =>
      '$this tidak boleh kurang dari $data karakter';
}

extension StringSuperCharged on String {
  String get toCapital {
    if (this != null) {
      return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
    }
    return 'error gan';
  }
}
