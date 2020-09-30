import 'package:bimbingan_kuy_admin/service/network/departemen_service.dart';
import 'package:bimbingan_kuy_admin/service/network/http_client.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'departemen.dart';
import 'departemen_controller/departemen_controller.dart';

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
              routeName: NameRoutes.departemen,
              page: () => DepartemenPage(),
              binding: BindingsBuilder(
                () {
                  Get.lazyPut(
                    () => DepartemenService(
                        dio: Get.find<HttpClient>(tag: StringUtil.dioWithAuth)
                            .dio),
                  );
                  Get.lazyPut(() => DepartemenController(
                      depService: Get.find<DepartemenService>()));
                },
              ),
            );
            break;
        }
        return navigator;
      },
    );
  }
}
