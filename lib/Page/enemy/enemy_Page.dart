import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EnemyPage extends StatelessWidget {
  final email;
  const EnemyPage({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Dữ liệu Địch Mở đèo'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(email)
            .collection('killdeo')
            .orderBy("Date")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Lỗi Connet'),
            );
          }
          if (snapshot.connectionState == ConnectionState.active) {
            return ListView(
                children: snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 9, bottom: 9)
                      .r,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: const Color.fromARGB(255, 233, 88, 88),
                    ),
                    borderRadius:
                        BorderRadius.all(const Radius.circular(7.0).r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            data['Name'],
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w600),
                          ),
                          Text("Kingdom ${data['Kingdom'].toString()}",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pow',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                          Text(
                            'Kill T4/T5',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                          Text(
                            'Death',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      SizedBox(width: 0.0, height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            numberFormat.format(data['Pow']),
                            style: TextStyle(fontSize: 17.sp),
                          ),
                          Text(
                            numberFormat.format(data['Kill']),
                            style: TextStyle(fontSize: 17.sp),
                          ),
                          Text(
                            numberFormat.format(data['Death']),
                            style: TextStyle(fontSize: 17.sp),
                          ),
                        ],
                      ),
                      SizedBox(width: 0.0, height: 10.h),
                    ],
                  ),
                ),
              );
            }).toList());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
