import 'package:effective_mobile/features/ticket/domain/entities/info_ticket.dart';

class InfoTicketModel extends InfoTicket {
  const InfoTicketModel(
      {required super.town, required super.date, required super.airport});
  factory InfoTicketModel.fromJson(Map<String, dynamic> json) {
    return InfoTicketModel(
      town: json['town'],
      date: DateTime.parse(json['date']),
      airport: json['airport'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'town': town,
      'date': date.toIso8601String(),
      'airport': airport,
    };
  }
}
