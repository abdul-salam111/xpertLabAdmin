import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

var firebasestorage=FirebaseStorage.instance;
var firebasefirestore=FirebaseFirestore.instance;
var firebaseauth=FirebaseAuth.instance;

//collections
const userCollection = "users";
const testCategoriesCollection="testCategories";
const testSubCategoryCollection="sub_Categories";
const testDetailsCollection="test_Details";
const testCartCollection='test_Cart';
const bookingsCollection='bookings';
const allTestscollection='allTests';
const offerandDealscollection="offersAndDeals";
const packageBookingscollection="packageBookings";