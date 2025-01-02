import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/SideBarController/SidebarController.dart';
import 'Dashboard/DashboardSidebarView.dart';

class SidebarView extends GetView<SidebarController> {
  const SidebarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Sidebar
        AnimatedContainer(
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
            width: MediaQuery.of(context).size.width > 768 ? 280 : MediaQuery.of(context).size.width * 0.85,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                    children: [
                      _buildMenuItem(0, 'Dashboard', Icons.dashboard_outlined),
                      _buildMenuItem(1, 'User Profile', Icons.person_outline),
                      _buildTableListItem(2),
                      _buildMenuItem(3, 'Typography', Icons.text_fields_outlined),
                      _buildMenuItem(4, 'Icons', Icons.bubble_chart_outlined),
                      _buildMenuItem(5, 'Maps', Icons.map_outlined),
                      _buildMenuItem(6, 'Notifications', Icons.notifications_outlined),
                      _buildMenuItem(7, 'RTL Support', Icons.language_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Nested Dashboard Sidebar
        Obx(() => controller.selectedIndex.value == 0
            ? DashboardNestedSidebar()
            : const SizedBox.shrink()),
      ],
    );
  }

  Widget _buildMenuItem(int index, String title, IconData icon) {
    return Obx(() {
      final isSelected = controller.selectedIndex.value == index;
      return MouseRegion(
        onEnter: (_) => controller.hoverIndex.value = index,
        onExit: (_) => controller.hoverIndex.value = -1,
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
              controller.changeIndex(index);
              controller.changeSubIndex(-1);
              Get.toNamed('/${title.toLowerCase().replaceAll(' ', '_')}');
            },
            minLeadingWidth: 20,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            hoverColor: Colors.white.withOpacity(0.1),
          ),
        ),
      );
    });
  }

  Widget _buildTableListItem(int index) {
    return Obx(() {
      final isSelected = controller.selectedIndex.value == index;
      return Column(
        children: [
          MouseRegion(
            onEnter: (_) => controller.hoverIndex.value = index,
            onExit: (_) => controller.hoverIndex.value = -1,
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
                  Icons.table_chart_outlined,
                  color: isSelected ? Colors.white : Colors.white60,
                  size: 22,
                ),
                title: Text(
                  'Table List',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white60,
                    fontSize: 15,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                trailing: Icon(
                  controller.isTableSubMenuOpen.value
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white60,
                ),
                onTap: () {
                  controller.changeIndex(index);
                  controller.toggleTableSubMenu();
                },
                minLeadingWidth: 20,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                hoverColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          if (controller.isTableSubMenuOpen.value) ...[
            _buildSubMenuItem('Basic Tables', 0),
            _buildSubMenuItem('Data Tables', 1),
          ],
        ],
      );
    });
  }

  Widget _buildSubMenuItem(String title, int subIndex) {
    return Obx(() {
      final isSelected = controller.selectedSubIndex.value == subIndex;
      return MouseRegion(
        onEnter: (_) => controller.hoverSubIndex.value = subIndex,
        onExit: (_) => controller.hoverSubIndex.value = -1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
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
            title: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontSize: 14,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 50, right: 16),
            onTap: () {
              controller.changeSubIndex(subIndex);
              Get.toNamed('/${title.toLowerCase().replaceAll(' ', '_')}');
            },
            hoverColor: Colors.white.withOpacity(0.1),
          ),
        ),
      );
    });
  }
}

