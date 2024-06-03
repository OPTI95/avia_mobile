import 'package:bloc/bloc.dart';
import 'package:effective_mobile/features/ticket/domain/usecases/get_list_tickets.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/ticket.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  final GetListTickets getListTickets;
  TicketCubit(this.getListTickets) : super(TicketInitial());

  Future<void> fetchTickets() async {
    emit(TicketLoading());
    try {
      final loadedListOrFailure = await getListTickets(NoParams());
      loadedListOrFailure.fold(
        (error) => emit(const TicketError(
            error: "Проблема при получении ответа с сервера")),
        (listTickets) => emit(
          TicketLoaded(list: listTickets),
        ),
      );
    } catch (_) {}
  }

  String calculateTime(DateTime departure, DateTime arrival) {
    Duration flightDuration = arrival.difference(departure);
    int hours = flightDuration.inHours;
    int minutes = flightDuration.inMinutes.remainder(60);
    if (minutes > 0) {
      return ('$hours.$minutes');
    } else {
      return ('$hours');
    }
  }

  String getHours(DateTime dateTime) {
    String formattedTime = DateFormat.Hm().format(dateTime);
    return formattedTime;
  }

  String formatPrice(int index) {
    if (state is TicketLoaded) {
      String priceString = (state as TicketLoaded).list[index].price.toString();
      StringBuffer formattedPrice = StringBuffer();

      int length = priceString.length;
      int count = 0;

      for (int i = length - 1; i >= 0; i--) {
        formattedPrice.write(priceString[i]);
        count++;
        if (count == 3 && i != 0) {
          formattedPrice.write(' ');
          count = 0;
        }
      }

      return formattedPrice.toString().split('').reversed.join('');
    } else {
      return "";
    }
  }
}
