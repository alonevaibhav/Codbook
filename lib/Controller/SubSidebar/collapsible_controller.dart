// controllers/collapsible_controller.dart
import 'package:get/get.dart';

class CollapsibleController extends GetxController {
  final RxMap<int, bool> collapsedStates = <int, bool>{}.obs;

  void toggleCollapse(int index) {
    if (!collapsedStates.containsKey(index)) {
      collapsedStates[index] = false;
    }
    collapsedStates[index] = !collapsedStates[index]!;
    update();
  }

  bool isCollapsed(int index) {
    return collapsedStates[index] ?? false;
  }
}