import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/User.dart';
import 'package:bimbingan_kuy_admin/global_model/dosen_network_model.dart';
import 'package:bimbingan_kuy_admin/global_model/formDosen_errorModel.dart';
import 'package:bimbingan_kuy_admin/util/utility/http_exception.dart';
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

  Future<User> createDosen() async {
    final userData = Get.find<DosenDetailController>().detailDosen;
    try {
      Response response = await dio.post(
        '/dosen/create',
        data: userData.toJson(),
      );
      return User.fromJson(response.data["user"]);
    } on DioError catch (e) {
      if (e.response.statusCode == 422) {
        throw FormValidationErrorException<FormDosenErrorModel>(
          FormDosenErrorModel.fromJson(e.response.data['errors']),
        );
      } else {
        throw e.withMessage();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<bool> updateDosen() async {
    final userData = Get.find<DosenDetailController>().detailDosen;
    try {
      Response response = await dio.put(
        '/dosen/update/${userData.dosen.id}',
        data: userData.toJson(),
      );
      return response.data['message'] as String == 'ok';
    } on DioError catch (e) {
      if (e.response.statusCode == 422) {
        throw FormValidationErrorException<FormDosenErrorModel>(
          FormDosenErrorModel.fromJson(e.response.data['errors']),
        );
      } else {
        throw e.withMessage();
      }
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
