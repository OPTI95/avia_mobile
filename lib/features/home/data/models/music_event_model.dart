import 'package:effective_mobile/features/home/domain/entities/music_events.dart';

class MusicEventModel extends MusicEvent {
  const MusicEventModel(
      {required super.id,
      required super.title,
      required super.town,
      required super.price});
  factory MusicEventModel.fromJson(Map<String, dynamic> json) {
    return MusicEventModel(
      id: json['id'] as int,
      title: json['title'] as String,
      town: json['town'] as String,
      price: json['price']['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'town': town,
      'price': price,
    };
  }
}
