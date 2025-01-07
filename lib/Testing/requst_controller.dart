import 'package:get/get.dart';

class RequestController extends GetxController {
  var activeRequestIndex = (-1).obs; // No request is active initially.

  // Set the active request index
  void setActiveRequest(int requestIndex) {
    activeRequestIndex.value = requestIndex;
  }
}
