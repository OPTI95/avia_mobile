import 'package:dartz/dartz.dart';
import 'package:effective_mobile/features/home/domain/entities/music_events.dart';
import 'package:effective_mobile/features/home/domain/repositories/home_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<MusicEvent>>> getListMusicEvents() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteListMusicEvents =
            await remoteDataSource.getMusicEventList();
        return Right(remoteListMusicEvents);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return const Right([]);
      } on CacheException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> saveTextFrom(String text) async {
    try {
      return Right(await localDataSource.cacheFromText(text));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getsaveTextFrom() async {
    try {
      return Right(await localDataSource.getFromText());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
