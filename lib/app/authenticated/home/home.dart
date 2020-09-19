import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_router.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_router.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: homeController.handleBackPress,
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: homeController.selectedIndex.value,
            children: [
              DosenRouter(),
              DepartemenRouter(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: homeController.updateIndexTab,
            items: [
              buildBottomNavigationBarItem(
                tabIndex: 0,
                text: 'Dosen',
                icon: Icons.people,
              ),
              buildBottomNavigationBarItem(
                tabIndex: 1,
                text: 'Departemen',
                icon: Icons.account_balance,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    int tabIndex,
    String text,
    IconData icon,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: homeController.changeColorToggleActive(tabIndex),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: homeController.changeColorToggleActive(tabIndex),
        ),
      ),
    );
  }
}
