import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toast({required String msg, required String color}) {
    Fluttertoast.showToast(msg: msg, webBgColor: color, webShowClose: true,timeInSecForIosWeb: 2);
  }
}
