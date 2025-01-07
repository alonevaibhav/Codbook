import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/SideBarController/SidebarController.dart';
import 'Testing/dashboard.dart';
import 'View/Dashboard/dashboard_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dashboard App',
      // theme: ThemeData.dark(),
      home: Dashboardoo(),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => SidebarController());
      }),
    );
  }
}
