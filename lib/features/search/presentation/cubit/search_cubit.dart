import 'package:bloc/bloc.dart';
import 'package:effective_mobile/core/usecase/usecase.dart';
import 'package:effective_mobile/features/search/domain/usecases/get_list_search_tickets.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/search.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetListSearchTickets getListSearchTickets;
  SearchCubit(this.getListSearchTickets) : super(SearchInitial());

  DateTime? returnDate;
  String? day;
  String? weekday;
  DateTime? toDate = DateTime.now();

  void getToDate(){
    
  }

  Future<void> fetchSearchTickets() async {
    emit(SearchLoading());
    try {
      final loadedListOrFailure = await getListSearchTickets(NoParams());
      loadedListOrFailure.fold(
        (error) => emit(const SearchError(
            error: "Проблема при получении ответа с сервера")),
        (listSearchEvent) => emit(
          SearchLoaded(list: listSearchEvent),
        ),
      );
    } catch (_) {}
  }

  String formatPrice(int index) {
    if (state is SearchLoaded) {
      String priceString = (state as SearchLoaded).list[index].price.toString();
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
