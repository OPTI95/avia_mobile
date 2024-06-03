import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/core/usecase/usecase.dart';
import 'package:effective_mobile/features/home/domain/repositories/home_repository.dart';
import '../entities/music_events.dart';

class GetListMusicEvents extends UseCase<List<MusicEvent>, NoParams> {
  final HomeRepository homeRepository;

  GetListMusicEvents({required this.homeRepository});

  @override
  Future<Either<Failure, List<MusicEvent>>> call(NoParams params) async =>
      await homeRepository.getListMusicEvents();
}
