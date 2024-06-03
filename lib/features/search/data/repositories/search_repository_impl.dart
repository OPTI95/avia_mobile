import 'package:dartz/dartz.dart';
import 'package:effective_mobile/features/search/data/datasources/search_remote_data_source.dart';
import 'package:effective_mobile/features/search/domain/entities/search.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Search>>> getListSearchTickets() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteListSearch = await remoteDataSource.getListSearchTickets();
        return Right(remoteListSearch);
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
}
