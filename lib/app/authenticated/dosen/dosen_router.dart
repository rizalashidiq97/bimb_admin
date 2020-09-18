import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dosen_detail.dart';
import 'dosen_list.dart';

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
        var navigator;
        switch (route.name) {
          case NameRoutes.dosen:
            navigator = GetPageRoute(
              page: () => DosenPage(),
            );
            break;
          case NameRoutes.dosenDetail:
            navigator = GetPageRoute(
              page: () => DosenDetail(),
            );
            break;
        }
        return navigator;
      },
    );
  }
}
