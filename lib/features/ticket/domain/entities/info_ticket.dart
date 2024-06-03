import 'package:equatable/equatable.dart';

class InfoTicket extends Equatable {
  final String town;
  final DateTime date;
  final String airport;

  const InfoTicket({required this.town, required this.date, required this.airport});

  @override
  List<Object?> get props => [town, date, airport];
}
