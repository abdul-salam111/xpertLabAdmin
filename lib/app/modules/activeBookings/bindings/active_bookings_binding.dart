import 'package:get/get.dart';

import '../controllers/active_bookings_controller.dart';

class ActiveBookingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveBookingsController>(
      () => ActiveBookingsController(),
    );
  }
}
