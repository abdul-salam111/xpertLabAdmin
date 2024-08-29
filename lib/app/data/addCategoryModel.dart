

import 'package:cloud_firestore/cloud_firestore.dart';

class AddCategory{
  String?category_Name;
  String?category_Image;
  AddCategory({required this.category_Image,required this.category_Name});
 factory AddCategory.fromJson(QueryDocumentSnapshot json) {
    return AddCategory(
      category_Image: json['category_Image'],
      category_Name: json['category_Name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_Image': category_Image,
      'category_Name': category_Name,
    };
  }
}