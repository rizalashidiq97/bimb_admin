import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_model.dart';
import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:bimbingan_kuy_admin/util/utility/http_exception.dart';
import 'package:dio/dio.dart';
import '../../util/extension/dioError_extension.dart';

class DepartemenService {
  final Dio dio;
  DepartemenService({this.dio});

  Future<Departemen> createDepartemen(Departemen departemen) async {
    try {
      Response response = await dio.post(
        '/departemen',
        data: {"nama": departemen.nama},
      );
      return Departemen.fromJson(response.data['departemen']);
    } on DioError catch (e) {
      if (e.response.statusCode == 422) {
        throw FormValidationErrorException<DepartemenErrorModel>(
          DepartemenErrorModel.fromJson(e.response.data['errors']),
        );
      } else {
        throw e.withMessage();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateDepartemen(Departemen departemen) async {
    try {
      await dio.put(
        '/departemen/${departemen.id}',
        data: {"nama": departemen.nama},
      );
    } on DioError catch (e) {
      if (e.response.statusCode == 422) {
        throw FormValidationErrorException<DepartemenErrorModel>(
          DepartemenErrorModel.fromJson(e.response.data['errors']),
        );
      } else {
        throw e.withMessage();
      }
    } catch (e) {
      throw e;
    }
  }
}
