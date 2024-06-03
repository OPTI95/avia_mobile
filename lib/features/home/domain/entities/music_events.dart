import 'package:equatable/equatable.dart';

class MusicEvent extends Equatable {
  final int id;
  final String title;
  final String town;
  final int price;

  const MusicEvent(
      {required this.id,
      required this.title,
      required this.town,
      required this.price});


  @override
  List<Object?> get props => [id, title, price, town];
}
