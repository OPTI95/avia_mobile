import 'package:effective_mobile/features/ticket/domain/entities/info_ticket.dart';
import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  final int id;
  final String? badge;
  final int price;
  final String providerName;
  final String company;
  final InfoTicket departure;
  final InfoTicket arrival;
  final bool hasTransfer;

  const Ticket(
      {required this.id,
      required this.badge,
      required this.price,
      required this.providerName,
      required this.company,
      required this.departure,
      required this.arrival,
      required this.hasTransfer});

  @override
  List<Object?> get props => [id,badge,price,];
}
