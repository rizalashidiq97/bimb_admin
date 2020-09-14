import 'package:dio/dio.dart';

extension DioErrorExtension on DioError {
  String withMessage() {
    String message;
    if (this.type == DioErrorType.CONNECT_TIMEOUT) {
      message = 'Waktu koneksi habis';
    } else if (this.type == DioErrorType.RECEIVE_TIMEOUT) {
      message =
          'Batas penerimaan waktu pengambilan data telah habis, Silahkan coba lagi';
    } else if (this.type == DioErrorType.RESPONSE) {
      if (this.response.statusCode >= 400 && this.response.statusCode != 401) {
        message =
            'Proses pengambilan data gagal , status kode = ${this.response.statusCode}';
      } else {
        message = '${this.response.data["error"]}';
      }
    } else if (this.type == DioErrorType.DEFAULT) {
      message =
          'Proses pengambilan data gagal, silahkan cek jaringan anda pastikan anda terhubung ke internet';
    } else if (this.type == DioErrorType.CANCEL) {
      message = 'Proses dibatalkan';
    } else {
      message = 'Proses pengambilan data gagal';
    }
    return message;
  }
}
