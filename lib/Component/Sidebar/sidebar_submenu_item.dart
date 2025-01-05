import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/SideBarController/SidebarController.dart';

class SidebarSubMenuItem extends GetView<SidebarController> {
  final String title;
  final int subIndex;
  final VoidCallback onTap;

  const SidebarSubMenuItem({
    Key? key,
    required this.title,
    required this.subIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onTap();
            },
            hoverColor: Colors.white.withOpacity(0.1),
          ),
        ),
      );
    });
  }
}
