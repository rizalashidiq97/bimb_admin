extension ValidationStringErrorExtension on String {
  String get isRequired => '$this tidak boleh kosong';
  String get isInvalidFormat => 'Format $this tidak valid';
  String lengthMustBeOrGreaterThan(int data) =>
      '$this tidak boleh kurang dari $data karakter';
  String lengthBetween(int int1, int int2) =>
      'Panjang $this harus diantara $int1 - $int2 karakter';
  bool isSamewithConfPassword(String value) => value != null && this != value;
}

extension StringSuperCharged on String {
  String get toCapital {
    if (this != null) {
      return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
    }
    return 'error gan';
  }

  bool isNotBetween(int int1, int int2) {
    assert(int2 > int1, '$int2 lebih besar dari $int1');
    return this.length < int1 || this.length > int2;
  }
}
