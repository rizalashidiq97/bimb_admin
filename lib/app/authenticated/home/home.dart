import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/departemen/departemen_router.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/dosen/dosen_router.dart';
import 'package:bimbingan_kuy_admin/app/authenticated/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
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
          onTap: homeController.updateIndexTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                color: homeController.changeColorToggleActive(0),
              ),
              title: Text(
                'Dosen',
                style: TextStyle(
                  color: homeController.changeColorToggleActive(0),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
                color: homeController.changeColorToggleActive(1),
              ),
              title: Text(
                'Departemen',
                style: TextStyle(
                  color: homeController.changeColorToggleActive(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
