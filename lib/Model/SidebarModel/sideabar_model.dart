// Reusable Button Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SidebarButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Icon(
            icon,
            color: Colors.white60,
            size: 22,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          onTap: onTap,
          minLeadingWidth: 20,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          hoverColor: Colors.white.withOpacity(0.1),
        ),
      ),
    );
  }
}