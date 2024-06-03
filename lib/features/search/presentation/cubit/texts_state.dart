part of 'texts_cubit.dart';

sealed class TextsState extends Equatable {
  const TextsState();

  @override
  List<Object> get props => [];
}

final class TextsInitial extends TextsState {}

final class TextsLoading extends TextsState {}

final class TextsLoaded extends TextsState {
  final String textFrom;
  final String textTo;

  const TextsLoaded({required this.textFrom, required this.textTo});
}
