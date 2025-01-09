
import 'package:codbook/Controller/SubSidebar/requst_controller.dart';
import 'package:codbook/Testing/requst_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/SideBarController/SidebarController.dart';
import '../../Controller/SubSidebar/CollectionController.dart';
import '../../Controller/SubSidebar/collapsible_controller.dart';
import '../../Testing/request_page_view..dart';
import '../NavBar/nav_bar.dart';
import '../Sidebar/sidebar.dart';
import '../Sidebar/sub_sidebar.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RequestController requestController = Get.put(RequestController());
    final CollectionController collectionController = Get.put(CollectionController());
    final SidebarController controller = Get.put(SidebarController());

    return Scaffold(
      body: Column(
        children: [
          NavBar(),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 250,
                  height: double.infinity,
                  color: Color(0xFF141A29),
                  child: SidebarView(),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Obx(() {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: controller.isSubSidebarVisible.value ? 280 : 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF1A2235),
                              border: Border(
                                right: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: controller.isSubSidebarVisible.value
                                ? DashboardSidebar()
                                : null,
                          ),
                        );
                      }),
                      Expanded(
                        child: Obx(() {
                          final activeRequestIndex = requestController.activeRequestIndex.value;
                          if (activeRequestIndex == -1) {
                            return const Center(
                              child: Text(
                                'Select a request to view its page.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }
                          return RequestPageView(
                            requestId: 'Request $activeRequestIndex',
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}