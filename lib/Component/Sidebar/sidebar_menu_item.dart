import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/SideBarController/SidebarController.dart';

class SidebarMenuItem extends GetView<SidebarController> {
  final int index;
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const SidebarMenuItem({
    Key? key,
    required this.index,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              if (onTap != null) onTap!();
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
