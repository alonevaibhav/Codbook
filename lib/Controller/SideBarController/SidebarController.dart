import 'package:get/get.dart';

class SidebarController extends GetxController {
  var selectedIndex = 0.obs; // Tracks the selected main menu index
  var selectedSubIndex = (-1).obs; // Tracks the selected submenu index
  var isTableSubMenuOpen = false.obs; // Tracks Table submenu open/close state
  var isMoreMenuOpen = false.obs; // Tracks More submenu open/close state
  var hoverIndex = (-1).obs; // Tracks hover index for main items
  var hoverSubIndex = (-1).obs; // Tracks hover index for submenu items

  // New variables for Dashboard submenu
  var isDashboardSubMenuOpen = false.obs; // Tracks Dashboard submenu open/close state
  final dashboardSelectedIndex = 0.obs; // Tracks selected Dashboard submenu item
  final dashboardHoverIndex = (-1).obs; // Tracks hover index for Dashboard submenu items

  // Variable for subSidebar visibility
  var isSubSidebarVisible = false.obs;

  // Function to change the main menu index
  void changeIndex(int index) {
    if (index == 0) {
      // If Dashboard is clicked, toggle the subSidebar visibility
      isSubSidebarVisible.value = !isSubSidebarVisible.value;
    } else {
      // For all other menu items, hide the subSidebar
      isSubSidebarVisible.value = false;
    }

    selectedIndex.value = index;
    closeAllSubMenus();
  }

  // Function to close all submenus
  void closeAllSubMenus() {
    isDashboardSubMenuOpen.value = false;
    isTableSubMenuOpen.value = false;
    isMoreMenuOpen.value = false;
  }

  // Function to toggle the Dashboard submenu
  void toggleDashboardSubMenu() {
    isDashboardSubMenuOpen.value = !isDashboardSubMenuOpen.value;
  }

  // Function to toggle the Table submenu
  void toggleTableSubMenu() {
    isTableSubMenuOpen.value = !isTableSubMenuOpen.value;
  }

  // Function to toggle the More submenu
  void toggleMoreMenu() {
    isMoreMenuOpen.value = !isMoreMenuOpen.value;
  }

  // Function to change the Dashboard submenu index
  void changeDashboardIndex(int index) {
    dashboardSelectedIndex.value = index;
  }

  // Function to change the submenu index
  void changeSubIndex(int index) {
    selectedSubIndex.value = index;
  }
}
