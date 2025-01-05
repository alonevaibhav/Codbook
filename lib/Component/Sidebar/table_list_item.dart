import 'package:codbook/Component/Sidebar/sidebar_submenu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/SideBarController/SidebarController.dart';
import '../../View/Dashboard/dashboard_web.dart';

class TableListItem extends GetView<SidebarController> {
  final int index;

  const TableListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            SidebarSubMenuItem(
              title: 'Basic Tables',
              subIndex: 0,
              onTap: () => Get.to(() => DashboardWeb()),
            ),
            SidebarSubMenuItem(
              title: 'Data Tables',
              subIndex: 1,
              onTap: () => Get.to(() => DashboardWeb()),
            ),
          ],
        ],
      );
    });
  }
}
