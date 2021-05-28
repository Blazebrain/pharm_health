import 'package:fluttertoast/fluttertoast.dart';

// import '../../app_routing/app_navigator.dart';
import 'style/style.dart';

// final myAppToast = AppToast._instance();

class AppToast {
  AppToast._instance();
  static AppToast instance = AppToast._instance();

  // // bool _initialized = false;
  // final toast = FToast();

  // void initializeToast() {
  //   toast.init(AppNavigator.key.currentContext);
  //   _initialized = true;
  // }

  void success(title, body) {
    Fluttertoast.showToast(
      msg: title == null ? '$body' : '$title\n\n$body',
      backgroundColor: droTurquoiseColor,
      textColor: backgroundWhiteColor,
      gravity: ToastGravity.TOP,
    );
  }

  void message(title, body) {
    Fluttertoast.showToast(
      msg: title == null ? '$body' : '$title\n\n$body',
      backgroundColor: droTurquoiseColor,
      textColor: backgroundWhiteColor,
      gravity: ToastGravity.TOP,
    );
  }

  void error(title, body) {
    Fluttertoast.showToast(
      msg: title == null ? '$body' : '$title\n\n$body',
      backgroundColor: droPurpleColor,
      textColor: backgroundWhiteColor,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
