//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import '../../../Controller/SubSidebar/CollectionController.dart';
// import '../../../Helper/SubSidebarHelper/helper.dart';
//
//
// class SidebarContent extends StatelessWidget {
//   final CollectionController collectionController;
//   final VoidCallback onAddCollection;
//   final Function(int) onAddCode;
//   final Function(int, int) onAddRequest;
//
//   const SidebarContent({
//     Key? key,
//     required this.collectionController,
//     required this.onAddCollection,
//     required this.onAddCode,
//     required this.onAddRequest,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Add Collection Button
//           MouseRegion(
//             cursor: SystemMouseCursors.click,
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               constraints: const BoxConstraints(),
//               icon: const FaIcon(
//                 FontAwesomeIcons.plus, size: 14,
//                 color: Colors.white70,
//               ),
//               onPressed: onAddCollection,
//             ),
//           ),
//           const SizedBox(height: 8),
//           // Collections List
//           Obx(() => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: collectionController.collections.asMap().entries.map((collectionEntry) {
//               final collectionIndex = collectionEntry.key;
//               final collection = collectionEntry.value;
//               final isCollectionActive = collectionController.activeCollectionIndex.value == collectionIndex;
//
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Collection Row
//                   InkWell(
//                     onTap: () => collectionController.setActiveIndices(collectionIndex),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         color: isCollectionActive
//                             ? Colors.white.withOpacity(0.1)
//                             : Colors.transparent,
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 4, horizontal: 8),
//                       child: Row(
//                         children: [
//                           FaIcon(
//                             FontAwesomeIcons.folder,
//                             size: 14,
//                             color: getIconColor(isCollectionActive),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               collection.name,
//                               style: getTextStyle(isCollectionActive),
//                             ),
//                           ),
//                           PopupMenuButton<String>(
//                             icon: FaIcon(FontAwesomeIcons.ellipsisVertical, size: 14, color: getIconColor(isCollectionActive),),
//                             color: const Color(0xFF1A1E2D),
//                             itemBuilder: (context) => [
//                               PopupMenuItem(
//                                 value: 'add_code',
//                                 child: Row(
//                                   children: const [
//                                     FaIcon(
//                                       FontAwesomeIcons.code,
//                                       size: 14,
//                                       color: Colors.white70,
//                                     ),
//                                     SizedBox(width: 8),
//                                     Text(
//                                       'Add Code',
//                                       style: TextStyle(color: Colors.white70),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                             onSelected: (value) {
//                               if (value == 'add_code') {
//                                 onAddCode(collectionIndex);
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Code Items and Requests
//                   ...collection.codeItems.asMap().entries.map((codeEntry) {
//                     final codeIndex = codeEntry.key;
//                     final codeItem = codeEntry.value;
//                     final isCodeActive = isCollectionActive &&
//                         collectionController.activeCodeIndex.value == codeIndex;
//
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Code Item
//                         MouseRegion(
//                           cursor: SystemMouseCursors.click,
//                           child: InkWell(
//                             onTap: () => collectionController.setActiveIndices(
//                               collectionIndex,
//                               codeIndex,
//                             ),
//                             child: _buildCodeItem(
//                               codeItem,
//                               isCodeActive,
//                               collectionIndex,
//                               codeIndex,
//                             ),
//                           ),
//                         ),
//                         // Requests
//                         ...codeItem.requests.asMap().entries.map((requestEntry) {
//                           return _buildRequestItem(
//                             requestEntry.value,
//                             isCodeActive,
//                             collectionIndex,
//                             codeIndex,
//                             requestEntry.key,
//                           );
//                         }).toList(),
//                       ],
//                     );
//                   }).toList(),
//                   const SizedBox(height: 8),
//                 ],
//               );
//             }).toList(),
//           )),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCodeItem(
//       dynamic codeItem,
//       bool isCodeActive,
//       int collectionIndex,
//       int codeIndex,
//       ) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.transparent,
//       ),
//       padding: const EdgeInsets.only(left: 24, top: 4, bottom: 4, right: 8),
//       child: Row(
//         children: [
//           const FaIcon(
//             FontAwesomeIcons.code,
//             size: 14,
//             color: Colors.white54,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               codeItem.name,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.white54,
//               ),
//             ),
//           ),
//           PopupMenuButton<String>(
//             icon: const FaIcon(
//               FontAwesomeIcons.ellipsisVertical,
//               size: 14,
//               color: Colors.white54,
//             ),
//             color: const Color(0xFF1A1E2D),
//             itemBuilder: (context) => [
//               PopupMenuItem(
//                 value: 'add_request',
//                 child: Row(
//                   children: const [
//                     FaIcon(
//                       FontAwesomeIcons.link,
//                       size: 14,
//                       color: Colors.white70,
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       'Add Request',
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//             onSelected: (value) {
//               if (value == 'add_request') {
//                 onAddRequest(collectionIndex, codeIndex);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRequestItem(
//       dynamic request,
//       bool isCodeActive,
//       int collectionIndex,
//       int codeIndex,
//       int requestIndex,
//       ) {
//     final isRequestActive = isCodeActive && collectionController.activeRequestIndex.value == requestIndex;
//
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: InkWell(
//         onTap: () => collectionController.setActiveIndices(
//           collectionIndex,
//           codeIndex,
//           requestIndex,
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4),
//             color:
//             isRequestActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
//           ),
//           padding: const EdgeInsets.only(
//             left: 48,
//             top: 4,
//             bottom: 4,
//             right: 8,
//           ),
//           child: Row(
//             children: [
//               FaIcon(
//                 FontAwesomeIcons.link,
//                 size: 14,
//                 color: getIconColor(isRequestActive, baseColor: Colors.white38),
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 request.name,
//                 style: getTextStyle(
//                   isRequestActive,
//                   fontSize: 14,
//                   baseColor: Colors.white38,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Controller/SubSidebar/CollectionController.dart';
import '../../../Helper/SubSidebarHelper/helper.dart';
import '../../../Model/SubSidebarModel/subsidebar_model.dart';
import '../../../Controller/SubSidebar/collapsible_controller.dart';
import 'collapsible_section.dart';

class SidebarContent extends StatelessWidget {


  final CollectionController collectionController;
  final CollapsibleController collapsibleController;
  final VoidCallback onAddCollection;
  final Function(int) onAddCode;
  final Function(int, int) onAddRequest;

  const SidebarContent({
    Key? key,
    required this.collectionController,
    required this.collapsibleController,
    required this.onAddCollection,
    required this.onAddCode,
    required this.onAddRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAddCollectionButton(),
          const SizedBox(height: 8),
          _buildCollectionsList(),
        ],
      ),
    );
  }

  Widget _buildAddCollectionButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: const FaIcon(
          FontAwesomeIcons.plus,
          size: 14,
          color: Colors.white70,
        ),
        onPressed: onAddCollection,
      ),
    );
  }

  Widget _buildCollectionsList() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: collectionController.collections.asMap().entries.map((entry) {
        final collectionIndex = entry.key;
        final collection = entry.value;

        // Remove the type cast and handle the collection directly
        return _buildCollectionSection(collection, collectionIndex);
      }).toList(),
    ));
  }

  Widget _buildCollectionSection(CollectionItem collection, int collectionIndex) {
    final isCollectionActive = collectionController.activeCollectionIndex.value == collectionIndex;

    return CollapsibleSection(
      isCollapsed: collapsibleController.isCollapsed(collectionIndex),
      isActive: isCollectionActive,
      title: collection.name,
      icon: FontAwesomeIcons.folder,
      onToggle: () => collapsibleController.toggleCollapse(collectionIndex),
      onTap: () => collectionController.setActiveIndices(collectionIndex),
      trailing: _buildCollectionMenu(collectionIndex),
      children: collection.codeItems.asMap().entries.map((codeEntry) {
        return _buildCodeSection(codeEntry.value, collectionIndex, codeEntry.key);
      }).toList(),
    );
  }

  Widget _buildCodeSection(CodeItem codeItem, int collectionIndex, int codeIndex) {
    final isCollectionActive = collectionController.activeCollectionIndex.value == collectionIndex;
    final isCodeActive = isCollectionActive && collectionController.activeCodeIndex.value == codeIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => collectionController.setActiveIndices(collectionIndex, codeIndex),
          child: Container(
            padding: const EdgeInsets.only(left: 24, top: 4, bottom: 4, right: 8),
            child: Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.code,
                  size: 14,
                  color: Colors.white54,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    codeItem.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
                  ),
                ),
                _buildCodeMenu(collectionIndex, codeIndex),
              ],
            ),
          ),
        ),
        ...codeItem.requests.asMap().entries.map((requestEntry) {
          return _buildRequestItem(requestEntry.value, isCodeActive, collectionIndex, codeIndex, requestEntry.key);
        }).toList(),
      ],
    );
  }



  Widget _buildRequestItem(RequestItem request, bool isCodeActive, int collectionIndex, int codeIndex, int requestIndex) {
    final isRequestActive = isCodeActive && collectionController.activeRequestIndex.value == requestIndex;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => collectionController.setActiveIndices(collectionIndex, codeIndex, requestIndex),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isRequestActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          ),
          padding: const EdgeInsets.only(left: 48, top: 4, bottom: 4, right: 8),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.link,
                size: 14,
                color: isRequestActive ? Colors.white : Colors.white38,
              ),
              const SizedBox(width: 8),
              Text(
                request.name,
                style: TextStyle(
                  fontSize: 14,
                  color: isRequestActive ? Colors.white : Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCollectionMenu(int collectionIndex) {
    return PopupMenuButton<String>(
      icon: const FaIcon(
        FontAwesomeIcons.ellipsisVertical,
        size: 14,
        color: Colors.white70,
      ),
      color: const Color(0xFF1A1E2D),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'add_code',
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.code,
                size: 14,
                color: Colors.white70,
              ),
              SizedBox(width: 8),
              Text(
                'Add Code',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'add_code') {
          onAddCode(collectionIndex);
        }
      },
    );
  }

  Widget _buildCodeMenu(int collectionIndex, int codeIndex) {
    return PopupMenuButton<String>(
      icon: const FaIcon(
        FontAwesomeIcons.ellipsisVertical,
        size: 14,
        color: Colors.white54,
      ),
      color: const Color(0xFF1A1E2D),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'add_request',
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.link,
                size: 14,
                color: Colors.white70,
              ),
              SizedBox(width: 8),
              Text(
                'Add Request',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'add_request') {
          onAddRequest(collectionIndex, codeIndex);
        }
      },
    );
  }
}
final collectionController = Get.put(CollectionController());
final collapsibleController = Get.put(CollapsibleController());

  Widget _buildRequestItem(
      dynamic request,
      bool isCodeActive,
      int collectionIndex,
      int codeIndex,
      int requestIndex,
      ) {
    final isRequestActive = isCodeActive && collectionController.activeRequestIndex.value == requestIndex;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => collectionController.setActiveIndices(
          collectionIndex,
          codeIndex,
          requestIndex,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color:
            isRequestActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          ),
          padding: const EdgeInsets.only(
            left: 48,
            top: 4,
            bottom: 4,
            right: 8,
          ),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.link,
                size: 14,
                color: getIconColor(isRequestActive, baseColor: Colors.white38),
              ),
              const SizedBox(width: 8),
              Text(
                request.name,
                style: getTextStyle(
                  isRequestActive,
                  fontSize: 14,
                  baseColor: Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

