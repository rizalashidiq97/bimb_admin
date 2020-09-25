import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_detail/dosen_detail_controller/dosen_validation_controller.dart';
import 'package:bimbingan_kuy_admin/service/database/dosen_db.dart';
import 'package:bimbingan_kuy_admin/service/network/dosen_service.dart';
import 'package:bimbingan_kuy_admin/service/network/http_client.dart';
import 'package:bimbingan_kuy_admin/util/routes/name_routes.dart';
import 'package:bimbingan_kuy_admin/util/widget_utility/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dosen_detail/dosen_detail.dart';
import 'dosen_detail/dosen_detail_controller/dosen_detail_controller.dart';
import 'dosen_list/dosen_list.dart';
import 'dosen_list/dosen_list_controller.dart';
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
        var v;
        switch (route.name) {
          case NameRoutes.dosen:
            v = GetPageRoute(
              routeName: NameRoutes.dosen,
              binding: BindingsBuilder(() {
                Get.lazyPut(() => DosenDBService(), fenix: true);
                Get.lazyPut(
                  () => DosenService(
                    dio: Get.find<HttpClient>(tag: StringUtil.dioWithAuth).dio,
                    diowithoutAuth:
                        Get.find<HttpClient>(tag: StringUtil.dioWithoutAuth)
                            .dio,
                  ),
                );
                Get.put<DosenListController>(DosenListController(
                  dosenService: Get.find<DosenService>(),
                ));
              }),
              page: () => DosenPage(),
            );
            break;
          case NameRoutes.dosenDetail:
            final PassDataFromDosenListtoDosenDetail argument = route.arguments;
            v = GetPageRoute(
              binding: BindingsBuilder(
                () {
                  Get.lazyPut(() =>
                      DosenValidationController(crudMode: argument.crudMode));
                  Get.lazyPut(() => DosenDetailController(
                      data: argument, dosenService: Get.find<DosenService>()));
                },
              ),
              routeName: NameRoutes.dosenDetail,
              page: () => DosenDetail(),
            );
            break;
        }
        return v;
      },
    );
  }
}
