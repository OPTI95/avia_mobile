import 'package:bloc/bloc.dart';
import 'package:effective_mobile/core/usecase/usecase.dart';
import 'package:effective_mobile/features/home/domain/entities/music_events.dart';
import 'package:effective_mobile/features/home/domain/usecases/get_list_music_events.dart';
import 'package:equatable/equatable.dart';

part 'music_events_state.dart';

class MusicEventsCubit extends Cubit<MusicEventsState> {
  final GetListMusicEvents getListMusicEvents;

  MusicEventsCubit({
    required this.getListMusicEvents,
  }) : super(MusicEventInitial());

  Future<void> fetchGetMusicEvents() async {
    emit(LoadingMusicEventState());
    try {
      final loadedListOrFailure = await getListMusicEvents(NoParams());
      loadedListOrFailure.fold(
        (error) => emit(const ErrorMusicEventState(
            error: "Проблема при получении ответа с сервера")),
        (listMusicEvent) => emit(
          LoadedMusicEventState(list: listMusicEvent),
        ),
      );
    } catch (_) {}
  }

  String formatPrice(int index) {
    if (state is LoadedMusicEventState) {
      String priceString =
          (state as LoadedMusicEventState).list[index].price.toString();
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
