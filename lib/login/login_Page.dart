import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokboard/login/widgets/auth_contronller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 25).r,
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40).r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffd8d8d8),
                image: DecorationImage(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 45).r,
              child: Text(
                "Xin chào\nWelcome to Rok Board",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15).r,
              child: TextField(
                controller: emailController,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Tài Khoản",
                  labelStyle: TextStyle(
                    color: const Color(0xff888888),
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25).r,
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    controller: passwordController,
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Mật Khẩu",
                      labelStyle: TextStyle(
                        color: const Color(0xff888888),
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  const Text(
                    "Show",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: TextButton(
                onPressed: () {
                  AuthController.instance.login(emailController.text.trim(),
                      passwordController.text.trim());
                },
                style: TextButton.styleFrom(
                  side: BorderSide(width: 2.w),
                ),
                child: const Text(
                  "Đăng Nhập",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
