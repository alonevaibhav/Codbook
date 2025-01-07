import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/SideBarController/SidebarController.dart';
import '../../Testing/dashboard.dart';
import '../../View/Dashboard/dashboard_web.dart';
import 'sidebar_menu_item.dart';
import 'table_list_item.dart';

class SidebarDrawer extends GetView<SidebarController> {
  const SidebarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1E2D),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Drawer(
        elevation: 0,
        backgroundColor: Colors.transparent,
        width: MediaQuery.of(context).size.width > 600
            ? 200
            : MediaQuery.of(context).size.width * 0.85,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                children: [
                  SidebarMenuItem(
                    index: 0,
                    title: 'Dashboard',
                    icon: Icons.dashboard_outlined,
                    onTap: () => Get.to(() => Dashboardoo()),
                  ),
                  SidebarMenuItem(
                    index: 1,
                    title: 'User Profile',
                    icon: Icons.person_outline,
                    onTap: () => Get.to(() => Dashboardoo()),
                  ),
                  const TableListItem(index: 2),
                  SidebarMenuItem(
                    index: 3,
                    title: 'Typography',
                    icon: Icons.text_fields_outlined,

                  ),
                  SidebarMenuItem(
                    index: 4,
                    title: 'Icons',
                    icon: Icons.bubble_chart_outlined,
                  ),
                  SidebarMenuItem(
                    index: 5,
                    title: 'Maps',
                    icon: Icons.map_outlined,
                  ),
                  SidebarMenuItem(
                    index: 6,
                    title: 'Notifications',
                    icon: Icons.notifications_outlined,
                  ),
                  SidebarMenuItem(
                    index: 7,
                    title: 'RTL Support',
                    icon: Icons.language_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
