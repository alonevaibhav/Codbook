import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/SideBarController/SidebarController.dart';

class DashboardNestedSidebar extends GetView<SidebarController> {
   DashboardNestedSidebar({Key? key}) : super(key: key);

  SidebarController controller=new SidebarController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(top: 16, right: 1, bottom: 16,),
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
        width: MediaQuery.of(context).size.width > 768 ? 260 : MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                children: [
                  _buildDashboardHeader(),
                  const SizedBox(height: 16),
                  _buildDashboardItem(0, 'Overview', Icons.dashboard_customize_outlined),
                  _buildDashboardItem(1, 'Analytics', Icons.analytics_outlined),
                  _buildDashboardItem(2, 'Reports', Icons.description_outlined),
                  _buildDashboardItem(3, 'Settings', Icons.settings_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardHeader() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[700]!, Colors.blue[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.dashboard_rounded, color: Colors.white, size: 24),
          SizedBox(width: 12),
          Text(
            'Dashboard Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(int index, String title, IconData icon) {
    return Obx(() {
      final isSelected = controller.dashboardSelectedIndex.value == index;
      return MouseRegion(
        onEnter: (_) => controller.dashboardHoverIndex.value = index,
        onExit: (_) => controller.dashboardHoverIndex.value = -1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: isSelected
                ? LinearGradient(
              colors: [Colors.blue[400]!, Colors.blue[600]!],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
                : null,
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white60,
              size: 22,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            onTap: () {
              controller.changeDashboardIndex(index);
              Get.toNamed('/dashboard/${title.toLowerCase()}');
            },
            minLeadingWidth: 20,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            hoverColor: Colors.white.withOpacity(0.1),
          ),
        ),
      );
    });
  }
}