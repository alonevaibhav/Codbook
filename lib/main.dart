import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/SideBarController/SidebarController.dart';
import 'Testing/sidebar/dashboard_page.dart';

void main() {
  Get.put(SidebarController());
  runApp(
    GetMaterialApp(
      title: 'Dashboard App',
      theme: ThemeData.dark(),
      home:  DashboardPage(),
    ),
  );
}