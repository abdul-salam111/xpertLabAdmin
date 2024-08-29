import 'package:get/get.dart';

import '../controllers/upload_reports_controller.dart';

class UploadReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UploadReportsController>(
       UploadReportsController(),
    );
  }
}
