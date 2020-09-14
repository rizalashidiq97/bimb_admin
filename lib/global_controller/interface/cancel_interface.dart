import 'package:bimbingan_kuy_admin/service/http_client.dart';
import 'package:bimbingan_kuy_admin/util/utitity/string_util.dart';
import 'package:get/get.dart';

class ICancellableOperation {
  void cancel() {
    Get.find<HttpClient>(tag: StringUtil.dioWithoutAuth)
        .cancelToken
        .cancel('cancel request');
    Get.find<HttpClient>(tag: StringUtil.dioWithAuth)
        .cancelToken
        .cancel('cancel request');
  }
}
