import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'to_text_state.dart';

class ToTextCubit extends Cubit<String> {
  final TextEditingController textController;

  ToTextCubit()
      : textController = TextEditingController(),
        super('');

  void addText(String text) {
    textController.text = text;
    emit(text);
  }

  void clearText() {
    textController.clear();
    emit('');
  }

  @override
  Future<void> close() {
    textController.dispose();
    return super.close();
  }
}
