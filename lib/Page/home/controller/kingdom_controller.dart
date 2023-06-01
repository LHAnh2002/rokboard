import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rokboard/Page/home/Model/kingDom_Model.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  var KingdomList = <KingdomModel>[].obs;

  Future<void> getData(String email) async {
    try {
      isLoading.value = true;
      QuerySnapshot kingdoms = await FirebaseFirestore.instance
          .collection("user")
          .doc(email)
          .collection("sever")
          .orderBy("Rank")
          .get();
      KingdomList.clear();
      for (var kingdom in kingdoms.docs) {
        KingdomList.add(
          KingdomModel(
            kingdom['Rank'],
            kingdom['ID'],
            kingdom['Name'],
            kingdom['DeadsKvk'],
            kingdom['KillT4Kvk'],
            kingdom['KillT5Kvk'],
            kingdom.id,
            kingdom['Pow'],
          ),
        );
      }
      isLoading.value = false;
      update();
      // print(isLoading.value);
    } catch (e) {
      Get.snackbar("Error", '${e.toString()}');
    }
  }

  Future<void> searchFormFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('1842')
        .where('ID', isEqualTo: query)
        .get();

    // KingdomList =
    //     result.docs.map((e) => e.data()).cast<KingdomModel>().toList();
  }
}
