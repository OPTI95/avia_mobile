import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/features/ticket/domain/entities/ticket.dart';

abstract class TicketRepository {
  Future<Either<Failure, List<Ticket>>> getListTickets();
}
