import 'package:bimbingan_kuy_admin/global_model/dosen_network_model.dart';
import 'package:dio/dio.dart';
import '../util/extension/dioError_extension.dart';

class DosenService {
  final Dio dio;
  DosenService({this.dio});

  Future<DosenNetworkModel> getDataDosen() async {
    try {
      Response response = await dio.get('/users');
      return DosenNetworkModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.withMessage();
    } catch (e) {
      throw e;
    }
  }
}
