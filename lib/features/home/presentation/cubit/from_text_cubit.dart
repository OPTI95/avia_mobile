import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_save_text_from.dart';
import '../../domain/usecases/save_text_from.dart';

part 'from_text_state.dart';

class FromTextCubit extends Cubit<FromTextState> {
  final SaveTextFrom saveTextFrom;
  final GetSaveTextFrom getSaveTextFrom;
  FromTextCubit({required this.saveTextFrom, required this.getSaveTextFrom})
      : super(FromTextInitial());

  Future<void> getSaveText() async {
    emit(FromTextLoading());
    try {
      final loadedTextOrFailure = await getSaveTextFrom(NoParams());
      loadedTextOrFailure.fold(
        (error) => emit(const FromTextError(error: "Ошибка загрузки текста")),
        (text) => emit(
          FromTextLoaded(text: text),
        ),
      );
    } catch (_) {}
  }

  Future<void> saveText(String text) async {
    try {
      await saveTextFrom(
        FromParams(text: text),
      );
    } catch (_) {}
  }
}
