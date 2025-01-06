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