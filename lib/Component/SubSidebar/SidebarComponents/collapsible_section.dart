
// widgets/collapsible_section.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollapsibleSection extends StatelessWidget {
  final bool isCollapsed;
  final bool isActive;
  final String title;
  final VoidCallback onToggle;
  final VoidCallback onTap;
  final List<Widget> children;
  final Widget? trailing;
  final IconData icon;

  const CollapsibleSection({
    Key? key,
    required this.isCollapsed,
    required this.isActive,
    required this.title,
    required this.onToggle,
    required this.onTap,
    required this.children,
    required this.icon,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isActive
                  ? Colors.white.withOpacity(0.1)
                  : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onToggle,
                    child: FaIcon(
                      isCollapsed
                          ? FontAwesomeIcons.angleRight
                          : FontAwesomeIcons.angleDown,
                      size: 12,
                      color: isActive ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FaIcon(
                  icon,
                  size: 14,
                  color: isActive ? Colors.white : Colors.white70,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
        ),
        if (!isCollapsed) ...children,
      ],
    );
  }
}