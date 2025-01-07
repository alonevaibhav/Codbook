import 'package:codbook/Testing/requst_controller.dart';
import 'package:codbook/Testing/requst_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Component/SubSidebar/SidebarComponents/sidebar_content.dart';
import '../Controller/SubSidebar/CollectionController.dart';
import '../Controller/SubSidebar/collapsible_controller.dart';
import '../View/Sidebar/sidebar.dart';

class Dashboardoo extends StatelessWidget {
  const Dashboardoo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    final RequestController requestController = Get.put(RequestController());
    final CollectionController collectionController = Get.put(CollectionController());
    final CollapsibleController collapsibleController = Get.put(CollapsibleController());

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          SidebarView(),

          // Content Area
          Expanded(
            flex: 4,
            child: Obx(() {
              final activeRequestIndex = requestController.activeRequestIndex.value;
              if (activeRequestIndex == -1) {
                return const Center(
                  child: Text(
                    'Select a request to view its page.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }
              // Dynamically render the RequestPage
              final requestName = 'Request $activeRequestIndex'; // Use the actual request name
              return RequestPage(requestName: requestName);
            }),
          ),
        ],
      ),
    );
  }
}
