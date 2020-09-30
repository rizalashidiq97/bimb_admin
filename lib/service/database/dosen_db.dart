import 'package:bimbingan_kuy_admin/global_model/authModel/Departemen.dart';
import 'package:get_storage/get_storage.dart';

class DosenDBService {
  final storage = GetStorage();

  void saveDepartementoDB(List<Departemen> response) {
    final responseList = response.map((data) => data.toMap()).toList();
    storage.write('dataDepartemen', responseList);
  }

  bool isCallingApi() {
    if (storage.hasData('dataDepartemen')) {
      final departemen = storage.read('dataDepartemen') as List;
      return departemen == null || departemen.isEmpty;
    }
    return true;
  }

  List<Departemen> getDepartemenfromDB() {
    final departemen = storage.read('dataDepartemen') as List;
    return departemen.map((data) => Departemen.fromMap(data)).toList();
  }

  void addDepartementoDB(Departemen response) {
    final addData = getDepartemenfromDB()..add(response);
    saveDepartementoDB(addData);
  }

  void updateDepartemenDB(Departemen response) {
    var list = getDepartemenfromDB();
    final index = list.indexWhere((data) => data.id == response.id);
    if (index != -1) {
      list[index] = response;
      saveDepartementoDB(list);
    }
  }
}
