import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_admin_dashboard/services/data/providers/log_provider.dart';
import 'package:smart_admin_dashboard/services/data/repositories/auth_repository.dart';
import 'package:smart_admin_dashboard/services/data/repositories/log_repository.dart';
import 'package:smart_admin_dashboard/services/services/auth_service.dart';

import 'services/data/providers/auth_provider.dart';
import 'services/services/network_service.dart';

void main() {
  Get.put(NetWorkService());
  Get.put(AuthProvider(Get.find<NetWorkService>()));
  Get.put(LogProvider(Get.find<NetWorkService>()));
  Get.put(AuthRepository(Get.find<AuthProvider>()));
  Get.put(LogRepository(Get.find<LogProvider>()));
  Get.put(AuthService(Get.find<AuthRepository>()));
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dashboard - Admin Panel v0.1 ',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: Login(title: "Wellcome to the Admin & Dashboard Panel"),
      builder: EasyLoading.init(),
    );
  }
}
