import 'package:codbook/View/Sidebar/sub_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/Sidebar/sidebar_drawer.dart';
import '../../Controller/SideBarController/SidebarController.dart';

class SidebarView extends GetView<SidebarController> {
  const SidebarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar Drawer
          SidebarDrawer(),
      
          // Nested Dashboard Sidebar
          // Obx(() {
          //   // Check if the subSidebar should be visible
          //   return controller.isSubSidebarVisible.value
          //       ? DashboardSidebar()
          //       : const SizedBox.shrink();
          // }),
        ],
      ),
    );
  }
}
