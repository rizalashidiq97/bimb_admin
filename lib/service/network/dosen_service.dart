import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_model/dosen_network_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../util/extension/dioError_extension.dart';

class DosenService {
  final Dio dio;
  final Dio diowithoutAuth;
  DosenService({this.dio, this.diowithoutAuth});

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

  Future<String> createDosen() async {
    final userData = Get.find<DosenDetailController>().detailDosen.value;
    try {
      Response response = await dio.post(
        '/dosen/create',
        data: userData.toJson(),
      );
      return response.data['message'] as String;
    } on DioError catch (e) {
      throw e.withMessage();
    } catch (e) {
      throw e;
    }
  }

  Future<String> updateDosen() async {
    final userData = Get.find<DosenDetailController>().detailDosen.value;
    try {
      Response response = await dio.put(
        '/dosen/update/${userData.dosen.id}',
        data: userData.toJson(),
      );
      return response.data['message'] as String;
    } on DioError catch (e) {
      throw e.withMessage();
    } catch (e) {
      throw e;
    }
  }

  Future<List<Departemen>> getDepartemen() async {
    try {
      Response response = await diowithoutAuth.get('/departemen');
      return List<Departemen>.from(
        response.data.map((data) => Departemen.fromJson(data)),
      );
    } on DioError catch (e) {
      throw e.withMessage();
    } catch (e) {
      throw e;
    }
  }
}
