part of 'from_text_cubit.dart';

sealed class FromTextState extends Equatable {
  const FromTextState();

  @override
  List<Object> get props => [];
}

final class FromTextInitial extends FromTextState {}

final class FromTextLoading extends FromTextState {}

final class FromTextLoaded extends FromTextState {
  final String? text;

  const FromTextLoaded({required this.text});
}

final class FromTextError extends FromTextState {
  final String error;

  const FromTextError({required this.error});
}
