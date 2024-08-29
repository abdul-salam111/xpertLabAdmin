import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDE1xNtFcEw6GCpfLP6bA5ydR6ASeDbKYs",
          appId: "1:941593656276:web:21a551551b9d6df7b33441",
          messagingSenderId: "941593656276",
          projectId: "myxpertlab-bf2a4",
          storageBucket: "myxpertlab-bf2a4.appspot.com"));
  runApp(
    ScreenUtilInit(
        designSize: const Size(700, 1200),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Xpert Lab Admin",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }),
  );
}
