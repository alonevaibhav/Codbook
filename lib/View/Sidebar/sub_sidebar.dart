//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../../Component/SubSidebar/Dialog/AddCodeDialog.dart';
// import '../../Component/SubSidebar/Dialog/AddCollectionDialog.dart';
// import '../../Component/SubSidebar/Dialog/AddRequestDialog.dart';
// import '../../Component/SubSidebar/SubSidebarHeader/dashboard_header.dart';
// import '../../Controller/SubSidebar/CollectionController.dart';
// import '../../Helper/SubSidebarHelper/helper.dart';
//
// class DashboardSidebar extends StatelessWidget {
//   DashboardSidebar({Key? key}) : super(key: key);
//
//   final CollectionController collectionController = Get.put(CollectionController());
//
//
//   void _showAddCollectionDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AddCollectionDialog(
//         onCreate: (value) => collectionController.addCollection(value),
//       ),
//     );
//   }
//
//   void _showAddCodeDialog(BuildContext context, int collectionIndex) {
//     showDialog(
//       context: context,
//       builder: (context) => AddCodeDialog(
//         onCreate: (value) => collectionController.addCodeItem(collectionIndex, value),
//       ),
//     );
//   }
//
//   void _showAddRequestDialog(BuildContext context, int collectionIndex, int codeIndex) {
//     showDialog(
//       context: context,
//       builder: (context) => AddRequestDialog(
//         onCreate: (value) => collectionController.addRequest(collectionIndex, codeIndex, value),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.only(top: 16, right: 1, bottom: 16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1A1E2D),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Drawer(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         width: MediaQuery.of(context).size.width > 768
//             ? 350
//             : MediaQuery.of(context).size.width * 0.8,
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
//                 children: [
//                   const DashboardHeader(),
//                   const SizedBox(height: 16),
//                   Container(
//                     margin: const EdgeInsets.only(left: 8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Add Collection Button
//                         MouseRegion(
//                           cursor: SystemMouseCursors.click,
//                           child: IconButton(
//                             padding: EdgeInsets.zero,
//                             constraints: const BoxConstraints(),
//                             icon: const FaIcon(
//                               FontAwesomeIcons.plus,
//                               size: 14,
//                               color: Colors.white70,
//                             ),
//                             onPressed: () => _showAddCollectionDialog(context),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         // Collections List
//                         Obx(() => Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: collectionController.collections
//                                   .asMap()
//                                   .entries
//                                   .map((collectionEntry) {
//                                 final collectionIndex = collectionEntry.key;
//                                 final collection = collectionEntry.value;
//                                 final isCollectionActive = collectionController.activeCollectionIndex.value == collectionIndex;
//
//                                 return MouseRegion(
//                                   cursor: SystemMouseCursors.click,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       // Collection Row
//                                       InkWell(
//                                         onTap: () => collectionController
//                                             .setActiveIndices(collectionIndex),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(4),
//                                             color: isCollectionActive
//                                                 ? Colors.white.withOpacity(0.1)
//                                                 : Colors.transparent,
//                                           ),
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 4, horizontal: 8),
//                                           child: Row(
//                                             children: [
//                                               FaIcon(
//                                                 FontAwesomeIcons.folder,
//                                                 size: 14,
//                                                 color: getIconColor(
//                                                     isCollectionActive),
//                                               ),
//                                               const SizedBox(width: 8),
//                                               Expanded(
//                                                 child: Text(
//                                                   collection.name,
//                                                   style: getTextStyle(isCollectionActive),
//                                                 ),
//                                               ),
//                                               PopupMenuButton<String>(
//                                                 icon: FaIcon(
//                                                   FontAwesomeIcons
//                                                       .ellipsisVertical,
//                                                   size: 14,
//                                                   color: getIconColor(
//                                                       isCollectionActive),
//                                                 ),
//                                                 color: const Color(0xFF1A1E2D),
//                                                 itemBuilder: (context) => [
//                                                   PopupMenuItem(
//                                                     value: 'add_code',
//                                                     child: Row(
//                                                       children: const [
//                                                         FaIcon(
//                                                           FontAwesomeIcons.code,
//                                                           size: 14,
//                                                           color: Colors.white70,
//                                                         ),
//                                                         SizedBox(width: 8),
//                                                         Text(
//                                                           'Add Code',
//                                                           style: TextStyle(
//                                                               color: Colors
//                                                                   .white70),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                                 onSelected: (value) {
//                                                   if (value == 'add_code') {
//                                                     _showAddCodeDialog(context,
//                                                         collectionIndex);
//                                                   }
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       // Code Items List
//                                       // Code Items List
//                                       ...collection.codeItems.asMap().entries.map((codeEntry) {
//                                         final codeIndex = codeEntry.key;
//                                         final codeItem = codeEntry.value;
//                                         final isCodeActive =
//                                             isCollectionActive &&
//                                                 collectionController
//                                                     .activeCodeIndex
//                                                     .value ==
//                                                     codeIndex;
//
//                                         return Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             MouseRegion(
//                                               cursor: SystemMouseCursors.click,
//                                               child: InkWell(
//                                                 onTap: () => collectionController.setActiveIndices(
//                                                   collectionIndex,
//                                                   codeIndex,
//                                                 ),
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.circular(4),
//                                                     color: Colors.transparent,
//                                                   ),
//                                                   padding: const EdgeInsets.only(left: 24, top: 4, bottom: 4, right: 8),
//                                                   child: Row(
//                                                     children: [
//                                                       FaIcon(
//                                                         FontAwesomeIcons.code,
//                                                         size: 12,
//                                                         color: Colors.white54,
//                                                       ),
//                                                       const SizedBox(width: 8),
//                                                       Expanded(
//                                                         child: Text(
//                                                           codeItem.name,
//                                                           style: TextStyle(
//                                                             fontSize: 12,
//                                                             color: Colors.white54,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       PopupMenuButton<String>(
//                                                         icon: FaIcon(
//                                                           FontAwesomeIcons.ellipsisVertical,
//                                                           size: 12,
//                                                           color: Colors.white54,
//                                                         ),
//                                                         color: const Color(0xFF1A1E2D),
//                                                         itemBuilder: (context) => [
//                                                           PopupMenuItem(
//                                                             value: 'add_request',
//                                                             child: Row(
//                                                               children: const [
//                                                                 FaIcon(
//                                                                   FontAwesomeIcons.link,
//                                                                   size: 12,
//                                                                   color: Colors.white70,
//                                                                 ),
//                                                                 SizedBox(width: 8),
//                                                                 Text(
//                                                                   'Add Request',
//                                                                   style: TextStyle(color: Colors.white70),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                         onSelected: (value) {
//                                                           if (value == 'add_request') {
//                                                             _showAddRequestDialog(
//                                                               context,
//                                                               collectionIndex,
//                                                               codeIndex,
//                                                             );
//                                                           }
//                                                         },
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             // Requests List
//                                             ...codeItem.requests
//                                                 .asMap()
//                                                 .entries
//                                                 .map((requestEntry) {
//                                               final requestIndex =
//                                                   requestEntry.key;
//                                               final request =
//                                                   requestEntry.value;
//                                               final isRequestActive =
//                                                   isCodeActive &&
//                                                       collectionController
//                                                               .activeRequestIndex
//                                                               .value ==
//                                                           requestIndex;
//
//                                               return MouseRegion(
//                                                 cursor:
//                                                     SystemMouseCursors.click,
//                                                 child: InkWell(
//                                                   onTap: () =>
//                                                       collectionController
//                                                           .setActiveIndices(
//                                                               collectionIndex,
//                                                               codeIndex,
//                                                               requestIndex),
//                                                   child: Container(
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               4),
//                                                       color: isRequestActive
//                                                           ? Colors.white
//                                                               .withOpacity(0.1)
//                                                           : Colors.transparent,
//                                                     ),
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 48,
//                                                             top: 4,
//                                                             bottom: 4,
//                                                             right: 8),
//                                                     child: Row(
//                                                       children: [
//                                                         FaIcon(
//                                                           FontAwesomeIcons.link,
//                                                           size: 10,
//                                                           color: getIconColor(
//                                                               isRequestActive,
//                                                               baseColor: Colors
//                                                                   .white38),
//                                                         ),
//                                                         const SizedBox(
//                                                             width: 8),
//                                                         Text(
//                                                           request.name,
//                                                           style: getTextStyle(
//                                                             isRequestActive,
//                                                             fontSize: 11,
//                                                             baseColor:
//                                                                 Colors.white38,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               );
//                                             }).toList(),
//                                           ],
//                                         );
//                                       }).toList(),
//                                       const SizedBox(height: 8),
//                                     ],
//                                   ),
//                                 );
//                               }).toList(),
//                             )),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//

// File: dashboard_sidebar.dart

// File: dashboard_sidebar.dart



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/SubSidebar/Dialog/AddCodeDialog.dart';
import '../../Component/SubSidebar/Dialog/AddCollectionDialog.dart';
import '../../Component/SubSidebar/Dialog/AddRequestDialog.dart';
import '../../Component/SubSidebar/SidebarComponents/sidebar_content.dart';
import '../../Component/SubSidebar/SubSidebarHeader/dashboard_header.dart';
import '../../Controller/SubSidebar/CollectionController.dart';

class DashboardSidebar extends StatelessWidget {
  DashboardSidebar({Key? key}) : super(key: key);

  final CollectionController collectionController =
      Get.put(CollectionController());

  void _showAddCollectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddCollectionDialog(
        onCreate: (value) => collectionController.addCollection(value),
      ),
    );
  }

  void _showAddCodeDialog(BuildContext context, int collectionIndex) {
    showDialog(
      context: context,
      builder: (context) => AddCodeDialog(
        onCreate: (value) =>
            collectionController.addCodeItem(collectionIndex, value),
      ),
    );
  }

  void _showAddRequestDialog(
      BuildContext context, int collectionIndex, int codeIndex) {
    showDialog(
      context: context,
      builder: (context) => AddRequestDialog(
        onCreate: (value) =>
            collectionController.addRequest(collectionIndex, codeIndex, value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(top: 16, right: 1, bottom: 16),
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
        width: MediaQuery.of(context).size.width > 768
            ? 350
            : MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                children: [
                  const DashboardHeader(),
                  const SizedBox(height: 16),
                  SidebarContent(
                    collectionController: collectionController,
                    collapsibleController: collapsibleController,
                    onAddCollection: () => _showAddCollectionDialog(context),
                    onAddCode: (index) => _showAddCodeDialog(context, index),
                    onAddRequest: (collectionIndex, codeIndex) =>
                        _showAddRequestDialog(
                            context, collectionIndex, codeIndex),
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
