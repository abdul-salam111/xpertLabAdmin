import 'package:get/get.dart';

import '../controllers/addnewtest_controller.dart';

class AddnewtestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnewtestController>(
      () => AddnewtestController(),
    );
  }
}
