
import 'package:get/get.dart';

import '../../../../appConst/index.dart';

class ActiveBookingsController extends GetxController {

  var isloading = false.obs;
  var searchingText = "".obs;
  getAllBookings() {
    return firebasefirestore.collection(bookingsCollection).snapshots();
  }
  getAllPackages(){
    return firebasefirestore.collection(packageBookingscollection).snapshots();
  }
 
}
