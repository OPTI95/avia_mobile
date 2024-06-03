import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int id;
  final String title;
  final List<String> timerange;
  final int price;

  const Search(
      {required this.id,
      required this.title,
      required this.timerange,
      required this.price});

  @override
  List<Object?> get props => [id, title, timerange, price];
}
