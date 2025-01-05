
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Component/SubSidebar/dashboard_header.dart';
import '../../Controller/SubSidebar/CollectionController.dart';

class DashboardSidebar extends StatelessWidget {
  DashboardSidebar({Key? key}) : super(key: key);

  final CollectionController collectionController = Get.put(CollectionController());

  void _showAddCollectionDialog(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF1A1E2D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter collection name',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      collectionController.addCollection(value);
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        final value = textController.text;
                        if (value.isNotEmpty) {
                          collectionController.addCollection(value);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddCodeDialog(BuildContext context, int collectionIndex) {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF1A1E2D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter code name',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      collectionController.addCodeItem(collectionIndex, value);
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        final value = textController.text;
                        if (value.isNotEmpty) {
                          collectionController.addCodeItem(collectionIndex, value);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddRequestDialog(BuildContext context, int collectionIndex, int codeIndex) {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF1A1E2D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter request name',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      collectionController.addRequest(collectionIndex, codeIndex, value);
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        final value = textController.text;
                        if (value.isNotEmpty) {
                          collectionController.addRequest(collectionIndex, codeIndex, value);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
        width: MediaQuery.of(context).size.width > 768 ? 350 : MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                children: [
                  const DashboardHeader(),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Add Collection Button
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const FaIcon(
                            FontAwesomeIcons.plus,
                            size: 14,
                            color: Colors.white70,
                          ),
                          onPressed: () => _showAddCollectionDialog(context),
                        ),
                        const SizedBox(height: 8),
                        // Collections List
                        Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: collectionController.collections.asMap().entries.map((collectionEntry) {
                            final collectionIndex = collectionEntry.key;
                            final collection = collectionEntry.value;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Collection Row
                                Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.folder,
                                      size: 14,
                                      color: Colors.white70,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        collection.name,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<String>(
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
                                          _showAddCodeDialog(context, collectionIndex);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                // Code Items List
                                ...collection.codeItems.asMap().entries.map((codeEntry) {
                                  final codeIndex = codeEntry.key;
                                  final codeItem = codeEntry.value;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 24, top: 4, bottom: 4),
                                        child: Row(
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons.code,
                                              size: 12,
                                              color: Colors.white54,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                codeItem.name,
                                                style: const TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            PopupMenuButton<String>(
                                              icon: const FaIcon(
                                                FontAwesomeIcons.ellipsisVertical,
                                                size: 12,
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
                                                        size: 12,
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
                                                  _showAddRequestDialog(
                                                    context,
                                                    collectionIndex,
                                                    codeIndex,
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Requests List
                                      ...codeItem.requests.map((request) => Padding(
                                        padding: const EdgeInsets.only(left: 48, top: 4, bottom: 4),
                                        child: Row(
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons.link,
                                              size: 10,
                                              color: Colors.white38,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              request.name,
                                              style: const TextStyle(
                                                color: Colors.white38,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )).toList(),
                                    ],
                                  );
                                }).toList(),
                                const SizedBox(height: 8),
                              ],
                            );
                          }).toList(),
                        )),
                      ],
                    ),
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