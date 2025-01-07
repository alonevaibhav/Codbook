// lib/pages/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../Sidebar/sidebar.dart';

class DashboardWeb extends GetView {
  @override
  Widget build(BuildContext context) {
    final isWeb = GetPlatform.isWeb && context.width > 1200;
    return Scaffold(
      appBar: !isWeb ? AppBar(title: const Text('Dashboard')) : null,
      drawer: !isWeb ? const SidebarView() : null,
      body: Row(
        children: [
          if (isWeb) const SidebarView(),
          const Expanded(child: Center(child: Text('Dashboard Content'))),
        ],
      ),
    );
  }
}
