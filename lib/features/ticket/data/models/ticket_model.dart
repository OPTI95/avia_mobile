import 'package:effective_mobile/features/ticket/data/models/info_ticket_model.dart';
import 'package:effective_mobile/features/ticket/domain/entities/ticket.dart';

class TicketModel extends Ticket {
  const TicketModel(
      {required super.id,
      required super.badge,
      required super.price,
      required super.providerName,
      required super.company,
      required super.departure,
      required super.arrival,
      required super.hasTransfer});
  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      badge: json['badge'],
      price: json['price']['value'],
      providerName: json['provider_name'],
      company: json['company'],
      departure: InfoTicketModel.fromJson(json['departure']),
      arrival: InfoTicketModel.fromJson(json['arrival']),
      hasTransfer: json['has_transfer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'badge': badge,
      'price': {'value': price},
      'provider_name': providerName,
      'company': company,
      'departure': (departure as InfoTicketModel).toJson(),
      'arrival': (arrival as InfoTicketModel).toJson(),
      'has_transfer': hasTransfer,
    };
  }
}
