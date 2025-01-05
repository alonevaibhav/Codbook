import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCollectionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCollectionButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        onPressed: onPressed,
      ),
    );
  }
}
