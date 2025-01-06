

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Controller/SubSidebar/CollectionController.dart';
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

    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: InkWell(
        onTap: () => collectionController.setActiveIndices(collectionIndex, codeIndex),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: FaIcon(
                    collapsibleController.isCollapsed(collectionIndex, codeIndex)
                        ? FontAwesomeIcons.caretRight
                        : FontAwesomeIcons.caretDown,
                    size: 14,
                    color: Colors.white70,
                  ),
                  onPressed: () => collapsibleController.toggleCollapse(collectionIndex, codeIndex),
                ),
                const SizedBox(width: 8),
                const FaIcon(
                  FontAwesomeIcons.code,
                  size: 14,
                  color: Colors.white54,
                ),
                const SizedBox(width: 8),
                Text(
                  codeItem.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
                const Spacer(),
                _buildCodeMenu(collectionIndex, codeIndex),
              ],
            ),
            if (!collapsibleController.isCollapsed(collectionIndex, codeIndex))
              ...codeItem.requests.asMap().entries.map((requestEntry) {
                return _buildRequestItem(
                  requestEntry.value,
                  isCodeActive,
                  collectionIndex,
                  codeIndex,
                  requestEntry.key,
                );
              }).toList(),
          ],
        ),
      ),
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
                  fontWeight: isRequestActive ? FontWeight.bold : FontWeight.normal,
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

final CollectionController collectionController = Get.put(CollectionController());
final CollapsibleController collapsibleController = Get.put(CollapsibleController());

