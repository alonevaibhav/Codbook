import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationDialog extends StatelessWidget {
  final String collectionName;
  final int collectionIndex;
  final VoidCallback onDeleteCollection;

  const ConfirmationDialog({
    Key? key,
    required this.collectionName,
    required this.collectionIndex,
    required this.onDeleteCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(

      backgroundColor: Colors.black.withOpacity(0.8), // Add opacity to make it stylish
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners for a smoother look
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding inside the dialog
        child: Container(
          height: 100,
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to delete "$collectionName"?',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      onDeleteCollection(); // Call delete collection
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: Text(
                      'Delete',
                      style: GoogleFonts.poppins(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
