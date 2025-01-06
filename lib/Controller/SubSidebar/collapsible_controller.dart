// controllers/collapsible_controller.dart
import 'package:get/get.dart';



class CollapsibleController extends GetxController {
  final _collapsedCodeSections = <int, Map<int, bool>>{}.obs;
  final _collapsedCollections = <int, bool>{}.obs;

  bool isCollapsed(int collectionIndex, [int? codeIndex]) {
    if (codeIndex != null) {
      return _collapsedCodeSections[collectionIndex]?[codeIndex] ?? false;
    }
    return _collapsedCollections[collectionIndex] ?? false;
  }

  void toggleCollapse(int collectionIndex, [int? codeIndex]) {
    if (codeIndex != null) {
      final codeSections = _collapsedCodeSections[collectionIndex] ?? {};
      codeSections[codeIndex] = !isCollapsed(collectionIndex, codeIndex);
      _collapsedCodeSections[collectionIndex] = codeSections;
    } else {
      _collapsedCollections[collectionIndex] = !isCollapsed(collectionIndex);
    }
  }
}