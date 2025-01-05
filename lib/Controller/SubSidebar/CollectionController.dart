// import 'package:get/get.dart';
//
// class RequestItem {
//   final String name;
//   final String method; // GET, POST, PUT, DELETE, etc.
//   final String url;
//
//   RequestItem({
//     required this.name,
//     this.method = 'GET',
//     this.url = '',
//   });
// }
//
// class CodeItem {
//   final String name;
//   final List<RequestItem> requests;
//
//   CodeItem({
//     required this.name,
//     List<RequestItem>? requests,
//   }) : requests = requests ?? [];
// }
//
// class CollectionItem {
//   final String name;
//   final List<CodeItem> codeItems;
//
//   CollectionItem({
//     required this.name,
//     List<CodeItem>? codeItems,
//   }) : codeItems = codeItems ?? [];
// }
//
// class CollectionController extends GetxController {
//   final collections = <CollectionItem>[].obs;
//
//   void addCollection(String name) {
//     if (name.trim().isNotEmpty) {
//       collections.add(CollectionItem(name: name.trim()));
//     }
//   }
//
//   void addCodeItem(int collectionIndex, String codeName) {
//     if (codeName.trim().isNotEmpty && collectionIndex >= 0 && collectionIndex < collections.length) {
//       final collection = collections[collectionIndex];
//       final updatedCodeItems = [...collection.codeItems, CodeItem(name: codeName.trim())];
//       collections[collectionIndex] = CollectionItem(
//         name: collection.name,
//         codeItems: updatedCodeItems,
//       );
//     }
//   }
//
//   void addRequest(int collectionIndex, int codeIndex, String requestName) {
//     if (requestName.trim().isNotEmpty &&
//         collectionIndex >= 0 &&
//         collectionIndex < collections.length &&
//         codeIndex >= 0 &&
//         codeIndex < collections[collectionIndex].codeItems.length) {
//
//       final collection = collections[collectionIndex];
//       final codeItems = [...collection.codeItems];
//       final codeItem = codeItems[codeIndex];
//
//       final updatedRequests = [...codeItem.requests, RequestItem(name: requestName.trim())];
//       codeItems[codeIndex] = CodeItem(
//         name: codeItem.name,
//         requests: updatedRequests,
//       );
//
//       collections[collectionIndex] = CollectionItem(
//         name: collection.name,
//         codeItems: codeItems,
//       );
//     }
//   }
// }


// First, let's update the CollectionController to track active states
import 'package:get/get.dart';

class RequestItem {
  final String name;
  final String method;
  final String url;

  RequestItem({
    required this.name,
    this.method = 'GET',
    this.url = '',
  });
}

class CodeItem {
  final String name;
  final List<RequestItem> requests;

  CodeItem({
    required this.name,
    List<RequestItem>? requests,
  }) : requests = requests ?? [];
}

class CollectionItem {
  final String name;
  final List<CodeItem> codeItems;

  CollectionItem({
    required this.name,
    List<CodeItem>? codeItems,
  }) : codeItems = codeItems ?? [];
}

class CollectionController extends GetxController {
  final collections = <CollectionItem>[].obs;
  final activeCollectionIndex = RxInt(-1);
  final activeCodeIndex = RxInt(-1);
  final activeRequestIndex = RxInt(-1);

  void setActiveIndices(int collectionIndex, [int codeIndex = -1, int requestIndex = -1]) {
    activeCollectionIndex.value = collectionIndex;
    activeCodeIndex.value = codeIndex;
    activeRequestIndex.value = requestIndex;
  }


  void addCollection(String name) {
    if (name.trim().isNotEmpty) {
      collections.add(CollectionItem(name: name.trim()));
    }
  }

  void addCodeItem(int collectionIndex, String codeName) {
    if (codeName.trim().isNotEmpty && collectionIndex >= 0 && collectionIndex < collections.length) {
      final collection = collections[collectionIndex];
      final updatedCodeItems = [...collection.codeItems, CodeItem(name: codeName.trim())];
      collections[collectionIndex] = CollectionItem(
        name: collection.name,
        codeItems: updatedCodeItems,
      );
    }
  }

  void addRequest(int collectionIndex, int codeIndex, String requestName) {
    if (requestName.trim().isNotEmpty &&
        collectionIndex >= 0 &&
        collectionIndex < collections.length &&
        codeIndex >= 0 &&
        codeIndex < collections[collectionIndex].codeItems.length) {

      final collection = collections[collectionIndex];
      final codeItems = [...collection.codeItems];
      final codeItem = codeItems[codeIndex];

      final updatedRequests = [...codeItem.requests, RequestItem(name: requestName.trim())];
      codeItems[codeIndex] = CodeItem(
        name: codeItem.name,
        requests: updatedRequests,
      );

      collections[collectionIndex] = CollectionItem(
        name: collection.name,
        codeItems: codeItems,
      );
    }
  }

// ... rest of your existing controller methods ...
}