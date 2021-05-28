import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_dependencies.dart';
import 'app_routing/app_navigator.dart';
import 'app_routing/app_router.dart';
import 'base/view_base_classes/style/style.dart';
import 'utilities/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies.locate.register();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812), //TODO
      builder: () => MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        //? ROUTING PARAMS
        navigatorKey: AppNavigator.key,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: storeViewRoute,
        //? THEMING
        theme: ThemeData(
          primaryColor: droPurpleColor,
          splashColor: greyColor.withOpacity(0.5),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: droPurpleColor,
            selectionColor: droPurpleColor.withOpacity(0.35),
            selectionHandleColor: droTurquoiseColor,
          ),
          textTheme: GoogleFonts.mulishTextTheme(),
          dividerColor: const Color(0xFFECEBEB),
        ),
      ),
    ),
  );
}
