import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../profile/profile_Page.dart';

class SearchPage extends StatefulWidget {
  final email;
  const SearchPage({Key? key, this.email}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController seachtf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 116, 116),
        title: Container(
          height: 50.h,
          padding: const EdgeInsets.symmetric(horizontal: 15).r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25).r,
          ),
          child: TextField(
            controller: seachtf,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0).r,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20.sp,
                ),
                prefixIconConstraints:
                    BoxConstraints(maxHeight: 20.h, minWidth: 25.w),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[600])),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(widget.email)
            .collection('sever')
            .where(
              'ID',
              isEqualTo: int.parse(seachtf.text),
            )
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 7).r,
                  padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 12, bottom: 12)
                      .r,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 88, 88),
                    borderRadius:
                        BorderRadius.all(const Radius.circular(7.0).r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tên",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "ID",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 7)
                                .r,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              int Killt4Point = snapshot.data!.docChanges[index]
                                      .doc['KillT4Kvk'] *
                                  10;
                              int killt4 = snapshot
                                  .data!.docChanges[index].doc['KillT4Kvk'];
                              int Killt5Point = snapshot.data!.docChanges[index]
                                      .doc['KillT5Kvk'] *
                                  10;
                              int killt5 = snapshot
                                  .data!.docChanges[index].doc['KillT5Kvk'];
                              int DeadsKvk = snapshot
                                      .data!.docChanges[index].doc['DeadsKvk'] *
                                  100;

                              int deadstrop = snapshot
                                  .data!.docChanges[index].doc['DeadsKvk'];
                              int idnv =
                                  snapshot.data!.docChanges[index].doc['ID'];
                              int tongpoint =
                                  Killt4Point + Killt5Point + DeadsKvk;
                              String name =
                                  snapshot.data!.docChanges[index].doc['Name'];
                              int rank =
                                  snapshot.data!.docChanges[index].doc['Rank'];
                              int pow =
                                  snapshot.data!.docChanges[index].doc['Pow'];
                              String id = snapshot
                                  .data!.docChanges[index].doc['ID']
                                  .toString();
                              print(tongpoint);
                              Get.to(
                                () => ProfilePage(
                                  hoten: name,
                                  killt4point: Killt4Point,
                                  killt5point: Killt5Point,
                                  chet: DeadsKvk,
                                  idnv: idnv,
                                  tongpoint: tongpoint,
                                  killt4: killt4,
                                  killt5: killt5,
                                  deadstrop: deadstrop,
                                  rank: rank,
                                  id: id,
                                  email: widget.email,
                                  pow: pow,
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 9, bottom: 9)
                                .r,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: const Color.fromARGB(255, 233, 88, 88),
                              ),
                              borderRadius: BorderRadius.all(
                                  const Radius.circular(7.0).r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['Name'],
                                ),
                                Text(snapshot.data!.docChanges[index].doc['ID']
                                    .toString()),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
