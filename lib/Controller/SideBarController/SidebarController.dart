// lib/controllers/sidebar_controller.dart
import 'package:get/get.dart';

class SidebarController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedSubIndex = (-1).obs;
  var isTableSubMenuOpen = false.obs;
  var isMoreMenuOpen = false.obs;
  var hoverIndex = (-1).obs; // Existing hover index for main items
  var hoverSubIndex = (-1).obs; // Add this line for sub-menu items
  // New variables for dashboard submenu
  final dashboardSelectedIndex = 0.obs;
  final dashboardHoverIndex = (-1).obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void changeSubIndex(int index) {
    selectedSubIndex.value = index;
  }

  void toggleTableSubMenu() {
    isTableSubMenuOpen.value = !isTableSubMenuOpen.value;
  }

  void toggleMoreMenu() {
    isMoreMenuOpen.value = !isMoreMenuOpen.value;
  }

  void changeDashboardIndex(int index) {
    dashboardSelectedIndex.value = index;
  }
}
