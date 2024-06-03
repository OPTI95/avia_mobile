import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/features/search/domain/entities/search.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Search>>> getListSearchTickets();
}
