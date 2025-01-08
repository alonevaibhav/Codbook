import 'package:flutter/material.dart';
// navbar.dart
class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFF141A29),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildNotificationIcon(count: '0'),
          SizedBox(width: 20),
          _buildAlertIcon(),
          SizedBox(width: 20),
          _buildUserProfile(),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon({required String count}) {
    return Stack(
      children: [
        Icon(
          Icons.notifications_none,
          color: Colors.grey[400],
          size: 28,
        ),
        if (count != '0')
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                count,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAlertIcon() {
    return Stack(
      children: [
        Icon(
          Icons.notifications_none,
          color: Colors.grey[400],
          size: 28,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserProfile() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[800],
          child: Icon(Icons.person, color: Colors.grey[400]),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Carter',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Account settings',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        Icon(
          Icons.arrow_drop_down,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}