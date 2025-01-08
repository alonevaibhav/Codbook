import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Helper/alert_dialog.dart'; // Ensure you import the dialog

class CollectionMenu extends StatelessWidget {
  final int collectionIndex;
  final String collectionName;
  final Function(int) onAddCode;
  final Function(int) onDeleteCollection;

  const CollectionMenu({
    Key? key,
    required this.collectionIndex,
    required this.collectionName,
    required this.onAddCode,
    required this.onDeleteCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        PopupMenuItem(
          value: 'delete_collection',
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.trash,
                size: 14,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'Delete Collection',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'add_code') {
          onAddCode(collectionIndex);
        } else if (value == 'delete_collection') {
          // Show the confirmation dialog before deleting
          showDialog(
            context: context,
            builder: (context) {
              return ConfirmationDialog(
                collectionName: collectionName,
                collectionIndex: collectionIndex,
                onDeleteCollection: () {
                  onDeleteCollection(collectionIndex); // Perform the delete action
                },
              );
            },
          );
        }
      },
    );
  }
}
