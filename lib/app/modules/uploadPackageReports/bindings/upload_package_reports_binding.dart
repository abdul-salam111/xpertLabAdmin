import 'package:get/get.dart';

import '../controllers/upload_package_reports_controller.dart';

class UploadPackageReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadPackageReportsController>(
      () => UploadPackageReportsController(),
    );
  }
}
