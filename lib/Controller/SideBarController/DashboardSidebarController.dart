import 'package:get/get.dart';

class SidebarController extends GetxController {
  // Existing variables
  final selectedIndex = 0.obs;
  final selectedSubIndex = (-1).obs;
  final hoverIndex = (-1).obs;
  final hoverSubIndex = (-1).obs;
  final isTableSubMenuOpen = false.obs;

  // New variables for dashboard submenu
  final showDashboardSubmenu = false.obs;
  final dashboardSelectedIndex = 0.obs;
  final dashboardHoverIndex = (-1).obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    // Show dashboard submenu only when dashboard is selected (index 0)
    showDashboardSubmenu.value = index == 0;
    if (index != 2) { // 2 is the Table List menu index
      isTableSubMenuOpen.value = false;
      selectedSubIndex.value = -1;
    }
  }

  void changeDashboardIndex(int index) {
    dashboardSelectedIndex.value = index;
  }

// ... rest of your existing methods
}