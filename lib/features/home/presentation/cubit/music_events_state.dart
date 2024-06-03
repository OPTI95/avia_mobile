part of 'music_events_cubit.dart';

abstract class MusicEventsState extends Equatable {
  const MusicEventsState();

  @override
  List<Object> get props => [];
}

class MusicEventInitial extends MusicEventsState {}

class LoadingMusicEventState extends MusicEventsState {}

class ErrorMusicEventState extends MusicEventsState {
  final String error;

  const ErrorMusicEventState({required this.error});
}


class LoadedMusicEventState extends MusicEventsState {
  final List<MusicEvent> list;

  const LoadedMusicEventState({required this.list});
}
