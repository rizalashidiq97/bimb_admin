import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'departemen.dart';

class DepartemenRouter extends StatelessWidget {
  const DepartemenRouter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(2),
      initialRoute: NameRoutes.departemen,
      onGenerateRoute: (route) {
        var navigator;
        switch (route.name) {
          case NameRoutes.departemen:
            navigator = GetPageRoute(
              page: () => DepartemenPage(),
            );
            break;
        }
        return navigator;
      },
    );
  }
}
