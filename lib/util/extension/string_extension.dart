extension ValidationStringErrorExtension on String {
  String get isRequired => '$this tidak boleh kosong';
  String get isInvalidFormat => 'Format $this tidak valid';
  String lengthMustBeOrGreaterThan(int data) =>
      '$this tidak boleh kurang dari $data karakter';
}
