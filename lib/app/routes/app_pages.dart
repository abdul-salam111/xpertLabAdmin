import 'package:get/get.dart';
import '../modules/index.dart';
import '../modules/uploadPackageReports/bindings/upload_package_reports_binding.dart';
import '../modules/uploadPackageReports/views/upload_package_reports_view.dart';
import '../modules/uploadReports/bindings/upload_reports_binding.dart';
import '../modules/uploadReports/views/upload_reports_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SignIn(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWTEST,
      page: () => AddnewtestView(),
      binding: AddnewtestBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVE_BOOKINGS,
      page: () => ActiveBookingsView(),
      binding: ActiveBookingsBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACKS,
      page: () => const FeedbacksView(),
      binding: FeedbacksBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CATEGORY,
      page: () => const AddCategoryView(),
      binding: AddCategoryBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_REPORTS,
      page: () => const UploadReportsView(),
      binding: UploadReportsBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_PACKAGE_REPORTS,
      page: () => const UploadPackageReportsView(),
      binding: UploadPackageReportsBinding(),
    ),
  
  ];
}
