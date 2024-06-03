import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/core/network/network_info.dart';
import 'package:effective_mobile/features/ticket/data/datasources/ticket_remote_data_sourse.dart';
import 'package:effective_mobile/features/ticket/domain/entities/ticket.dart';
import 'package:effective_mobile/features/ticket/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketRemoteDataSourse ticketRemoteDataSourse;
  final NetworkInfo networkInfo;

  TicketRepositoryImpl(
      {required this.ticketRemoteDataSourse, required this.networkInfo});
  @override
  Future<Either<Failure, List<Ticket>>> getListTickets() async {
    if (await networkInfo.isConnected) {
      try {
        final llst = await ticketRemoteDataSourse.getTicketList();
        return Right(llst);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
