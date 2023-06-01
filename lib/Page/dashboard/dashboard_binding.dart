import 'package:get/get.dart';
import 'package:rokboard/Page/dashboard/dashboard_Controller.dart';
import 'package:rokboard/Page/dashboard/dashboard_Page.dart';
import 'package:rokboard/Page/home/kingdom_Page.dart';

import '../home/controller/kingdom_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
    // Get.lazyPut<DashboardPage>(() => const DashboardPage());
  }
}
