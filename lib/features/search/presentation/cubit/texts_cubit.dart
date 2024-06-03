import 'package:effective_mobile/features/home/presentation/cubit/from_text_cubit.dart';
import 'package:effective_mobile/features/home/presentation/cubit/to_text_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'texts_state.dart';

class TextsCubit extends Cubit<TextsState> {
  TextsCubit() : super(TextsInitial());

  void setInitial(BuildContext context) async {
    emit(TextsLoading());
    String? from = (context.read<FromTextCubit>().state as FromTextLoaded).text;
    String to = context.read<ToTextCubit>().state;
    emit(
      TextsLoaded(textFrom: from!, textTo: to),
    );
  }

  void change() {
    if (state is TextsLoaded) {
      final currentState = state as TextsLoaded;
      emit(TextsLoading());
      emit(TextsLoaded(
          textFrom: currentState.textTo, textTo: currentState.textFrom));
    }
  }
}
