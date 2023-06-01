import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../chart/pow/pow_Page.dart';
import '../chart/troops/troops_Page.dart';

class ProfilePage extends StatelessWidget {
  final hoten,
      killt4point,
      killt5point,
      chet,
      idnv,
      tongpoint,
      killt4,
      killt5,
      deadstrop,
      rank,
      id,
      email,
      pow;
  const ProfilePage(
      {Key? key,
      this.hoten,
      this.killt4point,
      this.killt5point,
      this.chet,
      this.idnv,
      this.tongpoint,
      this.killt4,
      this.killt5,
      this.deadstrop,
      this.rank,
      this.id,
      this.email,
      this.pow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat("#,###");

    String killt4pointTemp = numberFormat.format(killt4point);
    print(killt4pointTemp);
    String killt5pointTemp = numberFormat.format(killt5point);
    String chetTemp = numberFormat.format(chet);
    String tongpointTemp = numberFormat.format(tongpoint);
    String killt4Temp = numberFormat.format(killt4);
    String killt5Temp = numberFormat.format(killt5);
    String deadstropTemp = numberFormat.format(deadstrop);
    String powTemp = numberFormat.format(pow);

    print(killt5pointTemp);
    print(chetTemp);
    print(tongpointTemp);
    print(killt4Temp);
    print(killt5Temp);
    print(deadstropTemp);
    TableRow _table = TableRow(children: [
      Container(
        color: Color.fromARGB(241, 110, 21, 21),
        child: Padding(
          padding: const EdgeInsets.all(10).r,
          child: Text(
            '',
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(241, 110, 21, 21),
        child: Padding(
          padding: const EdgeInsets.all(10).r,
          child: Text(
            'Kills',
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(241, 110, 21, 21),
        child: Padding(
          padding: const EdgeInsets.all(10).r,
          child: Text(
            'Kills Point',
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ]);
    TableRow _table2 = TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          'T4 Kills',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Row(
          children: [
            Text(
              "${killt4Temp} ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              '* 10',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          '${killt4pointTemp}',
          style: TextStyle(
            color: Color.fromARGB(255, 29, 210, 183),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ]);
    TableRow _table3 = TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          'T5 Kills',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Row(
          children: [
            Text(
              "${killt5Temp} ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              '* 10',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          '${killt5pointTemp}',
          style: TextStyle(
            color: Color.fromARGB(255, 29, 210, 183),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ]);
    TableRow _table4 = TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          'Death Troops',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Row(
          children: [
            Text(
              "${deadstropTemp} ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              '* 100',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          '${chetTemp}',
          style: TextStyle(
            color: Color.fromARGB(255, 29, 210, 183),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ]);
    TableRow _table5 = TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          'Total',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Row(
          children: [
            Text(
              "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10).r,
        child: Text(
          '${tongpointTemp}',
          style: TextStyle(
            color: Color.fromARGB(255, 11, 115, 99),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 116, 116),
        shadowColor: const Color.fromARGB(255, 255, 100, 100),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "${hoten}",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              "(ID: ${idnv})",
              style: TextStyle(fontSize: 17.sp),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 0.0,
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10).r,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "STT ",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "#${rank}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Pow ",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${powTemp}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Tổng Điểm Point: ",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${tongpointTemp}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 0.0,
            height: 20.h,
          ),
          Table(
            textBaseline: TextBaseline.alphabetic,
            border: TableBorder.all(),
            defaultColumnWidth: const FixedColumnWidth(130),
            children: <TableRow>[_table, _table2, _table3, _table4, _table5],
          ),
          SizedBox(
            width: 0.0,
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (() {
                  Get.to(() => PowPage(
                        email: email,
                        id: id,
                        name: hoten,
                      ));
                }),
                child: Container(
                  // height: 35.h,
                  // width: 120.w,
                  // margin: const EdgeInsets.only(left: 15, right: 15, top: 7).r,
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
                  child: Text(
                    'Pow Chart',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Get.to(() => TroopsPage(
                        id: id,
                        name: hoten,
                        email: email,
                      ));
                  print(id);
                }),
                child: Container(
                  // margin: const EdgeInsets.only(left: 15, right: 15, top: 7).r,
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
                  child: Text(
                    'Troops Chart',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
