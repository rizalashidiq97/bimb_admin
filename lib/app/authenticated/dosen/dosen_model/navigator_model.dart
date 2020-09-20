import 'package:bimbingan_kuy_admin/global_model/authModel/User.dart';
import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';

class PassDataFromDosenListtoDosenDetail {
  final CRUDMode crudMode;
  final User user;

  PassDataFromDosenListtoDosenDetail({this.crudMode, this.user});
}
