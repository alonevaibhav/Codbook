import 'package:codbook/View/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/SideBarController/SidebarController.dart';
import 'View/Dashboard/dashboard_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard App',
      // theme: ThemeData.dark(),
      home: Dashboard(),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => SidebarController());
      }),
    );
  }
}
