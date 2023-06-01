import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rokboard/Page/home/controller/kingdom_controller.dart';
import 'package:rokboard/Page/profile/profile_Page.dart';
import 'package:rokboard/Page/search/search_page.dart';

class KingdomPage extends StatefulWidget {
  final email;
  const KingdomPage({Key? key, this.email}) : super(key: key);

  @override
  _KingdomPageState createState() => _KingdomPageState();
}

class _KingdomPageState extends State<KingdomPage> {
  @override
  Widget build(BuildContext context) {
    HomeController kingdomController = Get.put(HomeController());
    int i = 1;
    final _controller = TextEditingController();
    String _searchTerm = "";
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (HomeController) {
        kingdomController.getData(widget.email);

        return Scaffold(
          // backgroundColor: const Color.fromARGB(255, 227, 227, 225),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 244, 116, 116),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.to(SearchPage(
                    email: widget.email,
                  ));
                },
              )
            ],
          ),
          body: Column(
            children: [
              SizedBox(width: 0.0, height: 5.h),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 7).r,
                padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 12, bottom: 12)
                    .r,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 88, 88),
                  borderRadius: BorderRadius.all(const Radius.circular(7.0).r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "STT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
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
              SizedBox(width: 0.0, height: 5.h),
              Expanded(
                child: kingdomController.isLoading.value
                    ? ListView.builder(
                        itemCount: kingdomController.KingdomList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                    left: 15, right: 15, top: 7)
                                .r,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  int Killt4Point = kingdomController
                                          .KingdomList[index].KillT4Kvk *
                                      10;
                                  int killt4 = kingdomController
                                      .KingdomList[index].KillT4Kvk;
                                  int Killt5Point = kingdomController
                                          .KingdomList[index].KillT5Kvk *
                                      10;
                                  int killt5 = kingdomController
                                      .KingdomList[index].KillT5Kvk;
                                  int DeadsKvk = kingdomController
                                          .KingdomList[index].DeadsKvk *
                                      100;

                                  int deadstrop = kingdomController
                                      .KingdomList[index].DeadsKvk;
                                  int idnv =
                                      kingdomController.KingdomList[index].idnv;
                                  int tongpoint =
                                      Killt4Point + Killt5Point + DeadsKvk;
                                  String name =
                                      kingdomController.KingdomList[index].name;
                                  int rank =
                                      kingdomController.KingdomList[index].rank;
                                  int pow =
                                      kingdomController.KingdomList[index].pow;
                                  String id =
                                      kingdomController.KingdomList[index].id;
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
                                    color:
                                        const Color.fromARGB(255, 233, 88, 88),
                                  ),
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(7.0).r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(kingdomController
                                        .KingdomList[index].rank
                                        .toString()),
                                    Text(kingdomController
                                        .KingdomList[index].name),
                                    Text(kingdomController
                                        .KingdomList[index].idnv
                                        .toString()),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
