import 'package:get/get.dart';
import 'package:rokboard/Page/home/controller/kingdom_controller.dart';

class KingdomBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  }
}