import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  final email;
  const NotificationPage({Key? key, this.email}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController users = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  String? mtoken = "";
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print("Mã thông báo của tôi là: ${mtoken}");
      });
      saveToken(token!);
    });
  }

  initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = const IOSInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onSelectNotification: (String? payload) async {
      try {
        if (payload != null && payload.isNotEmpty) {
        } else {}
      } catch (e) {}
      return;
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("------------------onMessenger------------------");
      print(
          "onMessenger: ${message.notification?.title}/${message.notification?.body}");

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatTitle: true,
      );
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'dbfood',
        'dbfood',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidNotificationDetails,
          iOS: const IOSNotificationDetails());
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(widget.email)
        .set({'token': token});
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Người dùng được cấp quyền");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("Người dùng được cấp quyền tạm thời");
    } else {
      print("Người dùng đã từ chố quyền truy cập");
    }
  }

  void sendPuchMessage(String token, String body, String title) async {
    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAARqTK_-U:APA91bGu_2ZfSP8n0ApPYnw6ZIxl-WGdzm37PFPbDAgUrGnbyqNC3gg9DiAyiSWIkncloPppN-ggoLd1nxMRvqLNeBEzI2c73AgvMEvpm5kWzZcyFR9laOOze1i9_FLXeUZo3CToqlBj'
          },
          body: jsonEncode(<String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title
            },
            'notification': <String, dynamic>{
              'title': title,
              'body': body,
              'android_channel_id': 'dbfood'
            },
            'to': token,
          }));
    } catch (e) {
      if (kDebugMode) {
        print("error push notification");
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 116, 116),
        title: const Text('Gửi Thông Báo'),
      ),
      backgroundColor: const Color.fromARGB(255, 227, 227, 225),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.h,
              padding: const EdgeInsets.symmetric(horizontal: 15).r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25).r,
              ),
              child: TextField(
                controller: users,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0).r,
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 20.h, minWidth: 25.w),
                    border: InputBorder.none,
                    hintText: 'Users',
                    hintStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 20.sp)),
              ),
            ),
            SizedBox(width: 0.0, height: 10.h),
            Container(
              height: 50.h,
              padding: const EdgeInsets.symmetric(horizontal: 15).r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25).r,
              ),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0).r,
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20.h, minWidth: 25.w),
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle:
                      TextStyle(color: Colors.grey[600], fontSize: 20.sp),
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 10.h),
            Container(
              height: 50.h,
              padding: const EdgeInsets.symmetric(horizontal: 15).r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25).r,
              ),
              child: TextFormField(
                controller: body,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0).r,
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20.h, minWidth: 25.w),
                  border: InputBorder.none,
                  hintText: 'Nội dung',
                  hintStyle:
                      TextStyle(color: Colors.grey[600], fontSize: 20.sp),
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 10.h),
            InkWell(
              onTap: () async {
                String name = users.text.trim();
                String titleText = title.text.trim();
                String bodyText = body.text.trim();
                if (name != "") {
                  DocumentSnapshot snapshot = await FirebaseFirestore.instance
                      .collection("user")
                      .doc(name)
                      .get();
                  String token = snapshot['token'];
                  print(token);
                  sendPuchMessage(token, bodyText, titleText);
                }
              },
              child: Container(
                width: 110.w,
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
                child: const Center(
                  child: Text('Gửi'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
