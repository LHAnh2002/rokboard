import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rokboard/Page/file/flie_Page.dart';
import 'package:rokboard/Page/me/me_Controller.dart';
import 'package:rokboard/Page/search/search_page.dart';

import '../../login/widgets/auth_contronller.dart';
import '../Notification/Notification_page.dart';

class MePage extends GetView<MeController> {
  final email;
  const MePage(this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Xin chào'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (() {
                Get.to(NotificationPage(
                  email: email,
                ));
              }),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 9, bottom: 9)
                    .r,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color.fromARGB(255, 233, 88, 88),
                  ),
                  borderRadius: BorderRadius.all(const Radius.circular(7.0).r),
                ),
                child: const Text('Thông Báo'),
              ),
            ),
            SizedBox(width: 0.0, height: 10.h),
            InkWell(
              onTap: (() {
                Get.to(FliePage(
                  email: email,
                ));
              }),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 9, bottom: 9)
                    .r,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color.fromARGB(255, 233, 88, 88),
                  ),
                  borderRadius: BorderRadius.all(const Radius.circular(7.0).r),
                ),
                child: const Text('Files'),
              ),
            ),
            Container(
              child: Center(
                  child: TextButton(
                      onPressed: () {
                        AuthController.instance.logout();
                      },
                      child: const Text('logout'))),
            ),
          ],
        ),
      ),
    );
  }
}
