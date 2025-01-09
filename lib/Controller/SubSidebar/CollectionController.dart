
// File: lib/Controller/SubSidebar/CollectionController.dart
import 'package:get/get.dart';
import '../../Model/SubSidebarModel/subsidebar_model.dart';

class CollectionController extends GetxController {
  // Make collections observable
  final RxList<CollectionItem> collections = <CollectionItem>[].obs;
  final activeCollectionIndex = RxInt(-1);
  final activeCodeIndex = RxInt(-1);
  final activeRequestIndex = RxInt(-1);


  void setActiveIndices([int? collectionIndex, int? codeIndex, int? requestIndex]) {
    activeCollectionIndex.value = collectionIndex ?? -1;
    activeCodeIndex.value = codeIndex ?? -1;
    activeRequestIndex.value = requestIndex ?? -1;
  }

  void addCollection(String name) {
    if (name.trim().isNotEmpty) {
      collections.add(CollectionItem(
        name: name.trim(),
        codeItems: [],
      ));
      update();
    }
  }

  void addCodeItem(int collectionIndex, String codeName) {
    if (codeName.trim().isNotEmpty &&
        collectionIndex >= 0 &&
        collectionIndex < collections.length) {
      final List<CodeItem> updatedCodeItems = [
        ...collections[collectionIndex].codeItems,
        CodeItem(name: codeName.trim(), requests: [])
      ];

      collections[collectionIndex] = CollectionItem(
        name: collections[collectionIndex].name,
        codeItems: updatedCodeItems,
      );
      update();
    }
  }

  void addRequest(int collectionIndex, int codeIndex, String requestName) {
    if (requestName.trim().isNotEmpty &&
        collectionIndex >= 0 &&
        collectionIndex < collections.length &&
        codeIndex >= 0 &&
        codeIndex < collections[collectionIndex].codeItems.length) {

      final CollectionItem collection = collections[collectionIndex];
      final List<CodeItem> codeItems = [...collection.codeItems];
      final CodeItem codeItem = codeItems[codeIndex];

      final List<RequestItem> updatedRequests = [
        ...codeItem.requests,
        RequestItem(
          name: requestName.trim(),
          method: 'GET',
          url: '',
          codeSnippets: [],
          links: [],
        )
      ];

      codeItems[codeIndex] = CodeItem(
        name: codeItem.name,
        requests: updatedRequests,
      );

      collections[collectionIndex] = CollectionItem(
        name: collection.name,
        codeItems: codeItems,
      );

      update();
    }
  }

  void deleteCollection(int collectionIndex) {
    if (collectionIndex >= 0 && collectionIndex < collections.length) {
      collections.removeAt(collectionIndex);

      if (activeCollectionIndex.value == collectionIndex) {
        setActiveIndices();
      } else if (activeCollectionIndex.value > collectionIndex) {
        activeCollectionIndex.value--;
      }

      update();
    }
  }

  void deleteCode(int collectionIndex, int codeIndex) {
    if (collectionIndex >= 0 &&
        collectionIndex < collections.length &&
        codeIndex >= 0 &&
        codeIndex < collections[collectionIndex].codeItems.length) {

      final CollectionItem collection = collections[collectionIndex];
      final List<CodeItem> updatedCodeItems = [...collection.codeItems];
      updatedCodeItems.removeAt(codeIndex);

      collections[collectionIndex] = CollectionItem(
        name: collection.name,
        codeItems: updatedCodeItems,
      );

      if (activeCollectionIndex.value == collectionIndex &&
          activeCodeIndex.value == codeIndex) {
        setActiveIndices(activeCollectionIndex.value);
      } else if (activeCodeIndex.value > codeIndex) {
        activeCodeIndex.value--;
      }

      update();
    }
  }

  void deleteRequest(int collectionIndex, int codeIndex, int requestIndex) {
    if (collectionIndex >= 0 &&
        collectionIndex < collections.length &&
        codeIndex >= 0 &&
        codeIndex < collections[collectionIndex].codeItems.length &&
        requestIndex >= 0 &&
        requestIndex < collections[collectionIndex].codeItems[codeIndex].requests.length) {

      final CollectionItem collection = collections[collectionIndex];
      final List<CodeItem> codeItems = [...collection.codeItems];
      final CodeItem codeItem = codeItems[codeIndex];
      final List<RequestItem> updatedRequests = [...codeItem.requests];

      updatedRequests.removeAt(requestIndex);

      codeItems[codeIndex] = CodeItem(
        name: codeItem.name,
        requests: updatedRequests,
      );

      collections[collectionIndex] = CollectionItem(
        name: collection.name,
        codeItems: codeItems,
      );

      if (activeCollectionIndex.value == collectionIndex &&
          activeCodeIndex.value == codeIndex &&
          activeRequestIndex.value == requestIndex) {
        setActiveIndices(activeCollectionIndex.value, activeCodeIndex.value);
      } else if (activeRequestIndex.value > requestIndex) {
        activeRequestIndex.value--;
      }

      update();
    }
  }



  void addCodeSnippetToRequest(int collectionIndex, int codeIndex, int requestIndex, CodeSnippet snippet) {
    if (isValidRequestPath(collectionIndex, codeIndex, requestIndex)) {
      final request = collections[collectionIndex]
          .codeItems[codeIndex]
          .requests[requestIndex];

      final updatedRequest = RequestItem(
        name: request.name,
        method: request.method,
        url: request.url,
        codeSnippets: [...request.codeSnippets, snippet],
        links: request.links,
      );

      updateRequest(collectionIndex, codeIndex, requestIndex, updatedRequest);
    }
  }

  void addLinkToRequest(int collectionIndex, int codeIndex, int requestIndex, Link link) {
    if (isValidRequestPath(collectionIndex, codeIndex, requestIndex)) {
      final request = collections[collectionIndex]
          .codeItems[codeIndex]
          .requests[requestIndex];

      final updatedRequest = RequestItem(
        name: request.name,
        method: request.method,
        url: request.url,
        codeSnippets: request.codeSnippets,
        links: [...request.links, link],
      );

      updateRequest(collectionIndex, codeIndex, requestIndex, updatedRequest);
    }
  }

  void updateRequest(int collectionIndex, int codeIndex, int requestIndex, RequestItem updatedRequest) {
    if (isValidRequestPath(collectionIndex, codeIndex, requestIndex)) {
      final collection = collections[collectionIndex];
      final codeItems = [...collection.codeItems];
      final codeItem = codeItems[codeIndex];
      final requests = [...codeItem.requests];

      requests[requestIndex] = updatedRequest;

      codeItems[codeIndex] = CodeItem(
        name: codeItem.name,
        requests: requests,
      );

      collections[collectionIndex] = CollectionItem(
        name: collection.name,
        codeItems: codeItems,
      );

      update();
    }
  }

  bool isValidRequestPath(int collectionIndex, int codeIndex, int requestIndex) {
    return collectionIndex >= 0 &&
        collectionIndex < collections.length &&
        codeIndex >= 0 &&
        codeIndex < collections[collectionIndex].codeItems.length &&
        requestIndex >= 0 &&
        requestIndex < collections[collectionIndex].codeItems[codeIndex].requests.length;
  }

  RequestItem? getCurrentRequest() {
    if (activeCollectionIndex.value >= 0 &&
        activeCodeIndex.value >= 0 &&
        activeRequestIndex.value >= 0) {
      return collections[activeCollectionIndex.value]
          .codeItems[activeCodeIndex.value]
          .requests[activeRequestIndex.value];
    }
    return null;
  }


}