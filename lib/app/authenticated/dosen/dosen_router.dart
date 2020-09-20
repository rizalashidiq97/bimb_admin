import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dosen_detail.dart';
import 'dosen_detail_controller.dart';
import 'dosen_list.dart';
import 'dosen_model/navigator_model.dart';

class DosenRouter extends StatelessWidget {
  const DosenRouter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: NameRoutes.dosen,
      onGenerateRoute: (route) {
        switch (route.name) {
          case NameRoutes.dosen:
            return GetPageRoute(
              routeName: NameRoutes.dosen,
              page: () => DosenPage(),
            );
            break;
          case NameRoutes.dosenDetail:
            final PassDataFromDosenListtoDosenDetail data = route.arguments;
            return GetPageRoute(
              binding: BindingsBuilder(
                () => Get.put<DosenDetailController>(
                  DosenDetailController(id: data.idDosen),
                ),
              ),
              routeName: NameRoutes.dosenDetail,
              page: () => DosenDetail(),
            );
            break;
        }
      },
    );
  }
}
