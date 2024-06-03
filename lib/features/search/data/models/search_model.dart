import 'package:effective_mobile/features/search/domain/entities/search.dart';

class SearchModel extends Search {
  const SearchModel(
      {required super.id,
      required super.title,
      required super.timerange,
      required super.price});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'] as int,
      title: json['title'] as String,
      timerange: (json['time_range'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price']['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'time_range': timerange,
      'price': price,
    };
  }
}
