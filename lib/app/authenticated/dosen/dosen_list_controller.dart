import 'package:get/get.dart';

class DosenListController extends GetxController {
  @override
  void onReady() => initCallApi();

  Future<void> initCallApi() async {
    print('onReady is called');
  }

  @override
  void onClose() {
    print('onClose call');
    super.onClose();
  }
}
