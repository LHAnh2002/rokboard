import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rokboard/Page/dashboard/dashboard_Page.dart';
import 'package:rokboard/Page/dashboard/dashboard_binding.dart';
import 'package:rokboard/Page/home/kingdom_Page.dart';
import 'package:rokboard/login/login_Page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => const LoginPage());
    } else {
      print(user.uid);
      print(user.email);
      Get.offAll(() => DashboardPage(email: user.email),
          binding: DashboardBinding());
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "about login",
        "Login message",
        // backgroundColor: Colors.cyan[400],
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          'Thông Báo',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          "Đăng Nhập Thành Công 🥰🥰\nCảm Ơn bạn đã sử dụng dịch vụ của chúng tôi!!",
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
      );
      // print();
    } catch (e) {
      Get.snackbar(
        "about Login",
        "Login message",
        // backgroundColor: Colors.cyan[400],
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          'Thông Báo',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          "Tài Khoản Hoặc Mật Khẩu Sai 😥",
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
      );
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
