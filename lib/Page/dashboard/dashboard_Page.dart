import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rokboard/Page/dashboard/dashboard_Controller.dart';
import 'package:rokboard/Page/enemy/enemy_Page.dart';
import 'package:rokboard/Page/home/controller/kingdom_controller.dart';
import 'package:rokboard/Page/home/kingdom_Page.dart';
import 'package:rokboard/Page/me/me_Page.dart';

class DashboardPage extends StatelessWidget {
  final email;
  const DashboardPage({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(email);
    // HomeController kingdomController = Get.put(HomeController());
    // kingdomController.getData(email);

    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tapIndex,
            children: [
              KingdomPage(
                email: email,
              ),
              EnemyPage(email: email),
              MePage(email),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          onTap: controller.changeTapIndex,
          currentIndex: controller.tapIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            _bottomNavigationBar(icon: Icons.home, label: "Rank"),
            _bottomNavigationBar(
                icon: Icons.engineering_outlined, label: "Địch"),
            _bottomNavigationBar(icon: Icons.person, label: "Me"),
          ],
        ),
      );
    });
  }

  _bottomNavigationBar({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
