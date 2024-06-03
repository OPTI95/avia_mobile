import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/features/home/domain/entities/music_events.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MusicEvent>>> getListMusicEvents();
  Future<Either<Failure, String?>> getsaveTextFrom();
  Future<Either<Failure, void>> saveTextFrom(String text);
}
