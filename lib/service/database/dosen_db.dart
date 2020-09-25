import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:get_storage/get_storage.dart';

class DosenDBService {
  final storage = GetStorage();

  void saveDepartementoDB(List<Departemen> response) {
    final responseList = response.map((data) => data.toMap()).toList();
    final Map<String, dynamic> dataDepartemen = {"departemens": responseList};
    storage.write('dataDepartemen', dataDepartemen);
  }

  bool isCallingApi() {
    if (storage.hasData('dataDepartemen')) {
      final departemen = storage.read('dataDepartemen')['departemens'] as List;
      return departemen == null || departemen.isEmpty;
    }
    return true;
  }

  List<Departemen> getDepartemenfromDB() {
    final departemen = storage.read('dataDepartemen')['departemens'] as List;
    return departemen.map((data) => Departemen.fromMap(data)).toList();
  }
}
