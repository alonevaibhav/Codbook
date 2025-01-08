import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Helper/alert_dialog.dart'; // Ensure to import the ConfirmationDialog

class CodeMenu extends StatelessWidget {
  final int collectionIndex;
  final int codeIndex;
  final String codeIndexName;
  final Function(int, int) onAddRequest;
  final Function(int, int) onDeleteCode;

  const CodeMenu({
    Key? key,
    required this.collectionIndex,
    required this.codeIndex,
    required this.onAddRequest,
    required this.onDeleteCode,
    required this.codeIndexName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        PopupMenuItem(
          value: 'delete_code',
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.trash,
                size: 14,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'Delete Code',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'add_request') {
          onAddRequest(collectionIndex, codeIndex);
        } else if (value == 'delete_code') {
          // Show confirmation dialog before deleting the code
          showDialog(
            context: context,
            builder: (context) {
              return ConfirmationDialog(
                collectionName: codeIndexName,  // Customize collection name as required
                collectionIndex: collectionIndex,
                onDeleteCollection: () {
                  onDeleteCode(collectionIndex, codeIndex); // Perform delete action
                },
              );
            },
          );
        }
      },
    );
  }
}
