part of 'ticket_cubit.dart';

abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketLoaded extends TicketState {
  final List<Ticket> list;

  const TicketLoaded({required this.list});
}

class TicketError extends TicketState {
  final String error;

  const TicketError({required this.error});
}
