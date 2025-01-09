// File: lib/View/RequestPage/request_page_view.dart
import 'package:codbook/Testing/request_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Component/SubSidebar/SidebarComponents/sidebar_content.dart';
import '../Controller/SubSidebar/CollectionController.dart';
import '../Model/SubSidebarModel/subsidebar_model.dart';

class RequestPageView extends StatelessWidget {
  final String requestId;

  const RequestPageView({
    Key? key,
    required this.requestId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Create a unique controller for this specific request
    final requestController = Get.put(
      RequestContentController(
        collectionId: collectionController.activeCollectionIndex.value.toString(),
        codeId: collectionController.activeCodeIndex.value.toString(),
        requestId: collectionController.activeRequestIndex.value.toString(),
      ),
      tag: '${collectionController.activeCollectionIndex.value}_${collectionController.activeCodeIndex.value}_${collectionController.activeRequestIndex.value}',
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        final currentRequest = collectionController.getCurrentRequest();
        if (currentRequest == null) {
          return const Center(
            child: Text(
              'No request selected',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Code Snippets Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2235),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // Code Section Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Code Storage',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () => requestController.addNewCode(),
                          ),
                        ],
                      ),
                    ),
                    // Code List
                    Expanded(
                      child: Obx(
                            () => ListView.builder(
                          itemCount: requestController.codeSnippets.length,
                          itemBuilder: (context, index) {
                            final snippet = requestController.codeSnippets[index];
                            return CodeSnippetTile(
                              snippet: snippet,
                              onEdit: () => requestController.editCode(index),
                              onDelete: () => requestController.deleteCode(index),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Links Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2235),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // Links Section Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Links Storage',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () => requestController.addNewLink(),
                          ),
                        ],
                      ),
                    ),
                    // Links List
                    Expanded(
                      child: Obx(
                            () => ListView.builder(
                          itemCount: requestController.links.length,
                          itemBuilder: (context, index) {
                            final link = requestController.links[index];
                            return LinkTile(
                              link: link,
                              onEdit: () => requestController.editLink(index),
                              onDelete: () => requestController.deleteLink(index),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

// Code Snippet Tile Widget
class CodeSnippetTile extends StatelessWidget {
  final CodeSnippet snippet;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CodeSnippetTile({
    Key? key,
    required this.snippet,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFF141A29),
      child: ListTile(
        title: Text(
          snippet.title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          snippet.description,
          style: TextStyle(color: Colors.grey[400]),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

// Link Tile Widget
class LinkTile extends StatelessWidget {
  final Link link;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const LinkTile({
    Key? key,
    required this.link,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color(0xFF141A29),
      child: ListTile(
        title: Text(
          link.title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          link.url,
          style: TextStyle(color: Colors.grey[400]),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

