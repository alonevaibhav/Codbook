// File: lib/Model/SubSidebarModel/subsidebar_model.dart

import 'package:get/get.dart';

class RequestItem {
  final String name;
  final String method;
  final String url;
  final List<CodeSnippet> codeSnippets;
  final List<Link> links;

  RequestItem({
    required this.name,
    required this.method,
    required this.url,
    List<CodeSnippet>? codeSnippets,
    List<Link>? links,
  }) :
        codeSnippets = codeSnippets ?? [],
        links = links ?? [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'method': method,
    'url': url,
    'codeSnippets': codeSnippets.map((snippet) => snippet.toJson()).toList(),
    'links': links.map((link) => link.toJson()).toList(),
  };

  factory RequestItem.fromJson(Map<String, dynamic> json) => RequestItem(
    name: json['name'],
    method: json['method'],
    url: json['url'],
    codeSnippets: (json['codeSnippets'] as List?)
        ?.map((item) => CodeSnippet.fromJson(item))
        .toList(),
    links: (json['links'] as List?)
        ?.map((item) => Link.fromJson(item))
        .toList(),
  );
}

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

class CodeItem {
  final String name;
  final List<RequestItem> requests;

  CodeItem({
    required this.name,
    List<RequestItem>? requests,
  }) : requests = requests ?? [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'requests': requests.map((request) => request.toJson()).toList(),
  };

  factory CodeItem.fromJson(Map<String, dynamic> json) => CodeItem(
    name: json['name'],
    requests: (json['requests'] as List?)
        ?.map((item) => RequestItem.fromJson(item))
        .toList(),
  );
}

class CollectionItem {
  final String name;
  final List<CodeItem> codeItems;

  CollectionItem({
    required this.name,
    List<CodeItem>? codeItems,
  }) : codeItems = codeItems ?? [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'codeItems': codeItems.map((item) => item.toJson()).toList(),
  };

  factory CollectionItem.fromJson(Map<String, dynamic> json) => CollectionItem(
    name: json['name'],
    codeItems: (json['codeItems'] as List?)
        ?.map((item) => CodeItem.fromJson(item))
        .toList(),
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