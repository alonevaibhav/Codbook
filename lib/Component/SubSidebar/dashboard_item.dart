// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../Controller/SideBarController/SidebarController.dart';
//
// class DashboardItem extends StatelessWidget {
//   final int index;
//   final String title;
//   final IconData icon;
//
//   const DashboardItem({
//     Key? key,
//     required this.index,
//     required this.title,
//     required this.icon,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final SidebarController controller = Get.find();
//
//     return Obx(() {
//       final isSelected = controller.dashboardSelectedIndex.value == index;
//       return MouseRegion(
//         onEnter: (_) => controller.dashboardHoverIndex.value = index,
//         onExit: (_) => controller.dashboardHoverIndex.value = -1,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           margin: const EdgeInsets.symmetric(vertical: 4),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             gradient: isSelected
//                 ? LinearGradient(
//               colors: [Colors.blue[400]!, Colors.blue[600]!],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             )
//                 : null,
//           ),
//           child: ListTile(
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             leading: Icon(
//               icon,
//               color: isSelected ? Colors.white : Colors.white60,
//               size: 22,
//             ),
//             title: Text(
//               title,
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.white60,
//                 fontSize: 15,
//                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//               ),
//             ),
//             onTap: () {
//               controller.changeDashboardIndex(index);
//               Get.toNamed('/dashboard/${title.toLowerCase()}');
//             },
//             minLeadingWidth: 20,
//             contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             hoverColor: Colors.white.withOpacity(0.1),
//           ),
//         ),
//       );
//     });
//   }
// }
