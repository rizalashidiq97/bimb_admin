import 'package:get/get.dart';

class DosenDetailController extends GetxController {
  final int id;
  DosenDetailController({this.id});

  @override
  void onReady() => initCallApi();

  Future<void> initCallApi() async {
    print('onReady dosen detail is called');
  }

  RxInt data = 0.obs;

  @override
  void onInit() {
    data.value = id;
  }
}
