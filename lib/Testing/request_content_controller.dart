// // File: lib/Controllers/request_content_controller.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CodeSnippet {
//   final String title;
//   final String description;
//   final String code;
//
//   CodeSnippet({
//     required this.title,
//     required this.description,
//     required this.code,
//   });
// }
//
// class Link {
//   final String title;
//   final String url;
//   final String description;
//
//   Link({
//     required this.title,
//     required this.url,
//     this.description = '',
//   });
// }
//
// class RequestContentController extends GetxController {
//   final String requestId;
//
//   RequestContentController(this.requestId);
//
//   // Observable lists for code snippets and links
//   final RxList<CodeSnippet> codeSnippets = <CodeSnippet>[].obs;
//   final RxList<Link> links = <Link>[].obs;
//
//   // Code Snippet Methods
//   void addNewCode() {
//     final titleController = TextEditingController();
//     final descriptionController = TextEditingController();
//     final codeController = TextEditingController();
//
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Add New Code Snippet'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//                 hintText: 'Enter snippet title',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(
//                 labelText: 'Description',
//                 hintText: 'Enter snippet description',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: codeController,
//               maxLines: 5,
//               decoration: const InputDecoration(
//                 labelText: 'Code',
//                 hintText: 'Enter your code here',
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               if (titleController.text.isNotEmpty && codeController.text.isNotEmpty) {
//                 codeSnippets.add(CodeSnippet(
//                   title: titleController.text,
//                   description: descriptionController.text,
//                   code: codeController.text,
//                 ));
//                 Get.back();
//               }
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void editCode(int index) {
//     final snippet = codeSnippets[index];
//     final titleController = TextEditingController(text: snippet.title);
//     final descriptionController = TextEditingController(text: snippet.description);
//     final codeController = TextEditingController(text: snippet.code);
//
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Edit Code Snippet'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//                 hintText: 'Enter snippet title',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(
//                 labelText: 'Description',
//                 hintText: 'Enter snippet description',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: codeController,
//               maxLines: 5,
//               decoration: const InputDecoration(
//                 labelText: 'Code',
//                 hintText: 'Enter your code here',
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               if (titleController.text.isNotEmpty && codeController.text.isNotEmpty) {
//                 codeSnippets[index] = CodeSnippet(
//                   title: titleController.text,
//                   description: descriptionController.text,
//                   code: codeController.text,
//                 );
//                 Get.back();
//               }
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void deleteCode(int index) {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Delete Code Snippet'),
//         content: const Text('Are you sure you want to delete this code snippet?'),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               codeSnippets.removeAt(index);
//               Get.back();
//             },
//             child: const Text('Delete'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Link Methods
//   void addNewLink() {
//     final titleController = TextEditingController();
//     final urlController = TextEditingController();
//     final descriptionController = TextEditingController();
//
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Add New Link'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//                 hintText: 'Enter link title',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: urlController,
//               decoration: const InputDecoration(
//                 labelText: 'URL',
//                 hintText: 'Enter URL',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(
//                 labelText: 'Description',
//                 hintText: 'Enter link description',
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               if (titleController.text.isNotEmpty && urlController.text.isNotEmpty) {
//                 links.add(Link(
//                   title: titleController.text,
//                   url: urlController.text,
//                   description: descriptionController.text,
//                 ));
//                 Get.back();
//               }
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void editLink(int index) {
//     final link = links[index];
//     final titleController = TextEditingController(text: link.title);
//     final urlController = TextEditingController(text: link.url);
//     final descriptionController = TextEditingController(text: link.description);
//
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Edit Link'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//                 hintText: 'Enter link title',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: urlController,
//               decoration: const InputDecoration(
//                 labelText: 'URL',
//                 hintText: 'Enter URL',
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(
//                 labelText: 'Description',
//                 hintText: 'Enter link description',
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               if (titleController.text.isNotEmpty && urlController.text.isNotEmpty) {
//                 links[index] = Link(
//                   title: titleController.text,
//                   url: urlController.text,
//                   description: descriptionController.text,
//                 );
//                 Get.back();
//               }
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void deleteLink(int index) {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Delete Link'),
//         content: const Text('Are you sure you want to delete this link?'),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               links.removeAt(index);
//               Get.back();
//             },
//             child: const Text('Delete'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadRequestData();
//   }
//
//   void loadRequestData() {
//     // Load data specific to this requestId
//     // This could be from local storage or an API
//     // For now, we'll add some dummy data
//     codeSnippets.add(
//       CodeSnippet(
//         title: 'Example Code',
//         description: 'Sample description',
//         code: 'print("Hello World")',
//       ),
//     );
//
//     links.add(
//       Link(
//         title: 'Example Link',
//         url: 'https://example.com',
//         description: 'Sample link description',
//       ),
//     );
//   }
// }


// ---------------------------



// File: lib/Controllers/request_content_controller.dart


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeSnippet {
  final String title;
  final String description;
  final String code;

  CodeSnippet({
    required this.title,
    required this.description,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'code': code,
  };

  factory CodeSnippet.fromJson(Map<String, dynamic> json) => CodeSnippet(
    title: json['title'],
    description: json['description'],
    code: json['code'],
  );
}

class Link {
  final String title;
  final String url;
  final String description;

  Link({
    required this.title,
    required this.url,
    this.description = '',
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'url': url,
    'description': description,
  };

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    title: json['title'],
    url: json['url'],
    description: json['description'] ?? '',
  );
}

class RequestData {
  RxList<CodeSnippet> codeSnippets;
  RxList<Link> links;

  RequestData()
      : codeSnippets = <CodeSnippet>[].obs,
        links = <Link>[].obs;

  Map<String, dynamic> toJson() => {
    'codeSnippets': codeSnippets.map((snippet) => snippet.toJson()).toList(),
    'links': links.map((link) => link.toJson()).toList(),
  };

  factory RequestData.fromJson(Map<String, dynamic> json) {
    final data = RequestData();
    if (json['codeSnippets'] != null) {
      data.codeSnippets.value = (json['codeSnippets'] as List)
          .map((item) => CodeSnippet.fromJson(item))
          .toList();
    }
    if (json['links'] != null) {
      data.links.value = (json['links'] as List)
          .map((item) => Link.fromJson(item))
          .toList();
    }
    return data;
  }
}

class RequestContentController extends GetxController {
  final String collectionId;
  final String codeId;
  final String requestId;
  static final Map<String, RequestData> _requestDataStore = {};

  late RequestData _currentRequestData;

  // Modified to include all three IDs in the key to ensure uniqueness across collections
  String get _uniqueKey => '${collectionId}_${codeId}_$requestId';

  RxList<CodeSnippet> get codeSnippets => _currentRequestData.codeSnippets;
  RxList<Link> get links => _currentRequestData.links;

  RequestContentController({
    required this.collectionId,
    required this.codeId,
    required this.requestId,
  }) {
    // Initialize or get existing data for this request using the unique key
    if (!_requestDataStore.containsKey(_uniqueKey)) {
      _requestDataStore[_uniqueKey] = RequestData();
    }
    _currentRequestData = _requestDataStore[_uniqueKey]!;
  }
  // Method to clear data when collection is deleted
  static void clearCollectionData(String collectionId) {
    _requestDataStore.removeWhere(
          (key, value) => key.startsWith('collection_$collectionId'),
    );
    print('Cleared data for collection: $collectionId');
  }

  // Method to clear data when code item is deleted
  static void clearCodeData(String collectionId, String codeId) {
    _requestDataStore.removeWhere(
          (key, value) => key.startsWith('collection_${collectionId}_code_$codeId'),
    );
    print('Cleared data for collection: $collectionId, code: $codeId');
  }

  @override
  void onClose() {
    // Cleanup if needed when controller is disposed
    super.onClose();
  }

    void editCode(int index) {
    final snippet = codeSnippets[index];
    final titleController = TextEditingController(text: snippet.title);
    final descriptionController = TextEditingController(text: snippet.description);
    final codeController = TextEditingController(text: snippet.code);

    Get.dialog(
      AlertDialog(
        title: const Text('Edit Code Snippet'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter snippet title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter snippet description',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: codeController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Code',
                hintText: 'Enter your code here',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty && codeController.text.isNotEmpty) {
                codeSnippets[index] = CodeSnippet(
                  title: titleController.text,
                  description: descriptionController.text,
                  code: codeController.text,
                );
                Get.back();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void deleteCode(int index) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Code Snippet'),
        content: const Text('Are you sure you want to delete this code snippet?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              codeSnippets.removeAt(index);
              Get.back();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  //   // Link Methods
  void addNewLink() {
    final titleController = TextEditingController();
    final urlController = TextEditingController();
    final descriptionController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: const Text('Add New Link'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter link title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'URL',
                hintText: 'Enter URL',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter link description',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty && urlController.text.isNotEmpty) {
                links.add(Link(
                  title: titleController.text,
                  url: urlController.text,
                  description: descriptionController.text,
                ));
                Get.back();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void editLink(int index) {
    final link = links[index];
    final titleController = TextEditingController(text: link.title);
    final urlController = TextEditingController(text: link.url);
    final descriptionController = TextEditingController(text: link.description);

    Get.dialog(
      AlertDialog(
        title: const Text('Edit Link'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter link title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'URL',
                hintText: 'Enter URL',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter link description',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty && urlController.text.isNotEmpty) {
                links[index] = Link(
                  title: titleController.text,
                  url: urlController.text,
                  description: descriptionController.text,
                );
                Get.back();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void deleteLink(int index) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Link'),
        content: const Text('Are you sure you want to delete this link?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              links.removeAt(index);
              Get.back();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
  // Just replace references to codeSnippets and links with _currentRequestData.codeSnippets
  // and _currentRequestData.links respectively
  void addNewCode() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final codeController = TextEditingController();

    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF1A2235),
        title: const Text(
          'Add New Code Snippet',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: 'Enter snippet title',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: 'Enter snippet description',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: codeController,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Code',
                labelStyle: TextStyle(color: Colors.white70),
                hintText: 'Enter your code here',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty && codeController.text.isNotEmpty) {
                codeSnippets.add(CodeSnippet(
                  title: titleController.text,
                  description: descriptionController.text,
                  code: codeController.text,
                ));
                saveData();
                Get.back();
              }
            },
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
  // Similar updates for other methods...

  // Save data to persistent storage
  void saveData() {
    // Here you would implement saving to local storage or your backend
    // For example, using SharedPreferences or Hive
    print('Saving data for request: $requestId');
  }

  @override
  void onInit() {
    super.onInit();
    loadRequestData();
  }

  void loadRequestData() {
    // Load data from persistent storage if it exists
    // For now, we'll just initialize with empty data if it's a new request
    if (_currentRequestData.codeSnippets.isEmpty && _currentRequestData.links.isEmpty) {
      print('Initializing new request data for: $requestId');
    }
  }
}