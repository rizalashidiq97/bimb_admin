import 'package:bimbingan_kuy_admin/util/utility/enum_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dosen_list_controller.dart';

class ListItemDosen extends StatelessWidget {
  final int index;
  const ListItemDosen({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DosenListController controller = Get.find();

    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: () => controller.navigateToDetailDosen(
          CRUDMode.update,
          user: controller.list[index],
        ),
        title: Obx(
          () => Text(
            controller.list[index].dosen?.nama,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        trailing: Chip(
          backgroundColor: Get.theme.accentColor,
          label: Obx(
            () => Text(
              controller.list[index].departemen.nama,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(22),
                color: Colors.white,
              ),
            ),
          ),
        ),
        subtitle: Obx(
          () => Text(
            '${controller.roles(index)}',
            style: TextStyle(fontSize: ScreenUtil().setSp(28)),
          ),
        ),
      ),
    );
  }
}
