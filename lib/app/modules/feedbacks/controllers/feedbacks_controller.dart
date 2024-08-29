import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

class FeedbacksController extends GetxController {
  //TODO: Implement FeedbacksController
  QueryDocumentSnapshot? feedbackDetails;
  getAllFeedBacks()  {
    return firebasefirestore.collection("userFeedbackAndRating").get();
  }
}
