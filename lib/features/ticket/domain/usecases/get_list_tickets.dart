import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/core/usecase/usecase.dart';
import 'package:effective_mobile/features/ticket/domain/entities/ticket.dart';
import 'package:effective_mobile/features/ticket/domain/repositories/ticket_repository.dart';

class GetListTickets extends UseCase<List<Ticket>, NoParams> {
  final TicketRepository ticketRepository;

  GetListTickets({required this.ticketRepository});
  @override
  Future<Either<Failure, List<Ticket>>> call(NoParams params) async =>
      await ticketRepository.getListTickets();
}
