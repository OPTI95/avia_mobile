import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/core/usecase/usecase.dart';
import 'package:effective_mobile/features/search/domain/repositories/search_repository.dart';

import '../entities/search.dart';

class GetListSearchTickets extends UseCase<List<Search>, NoParams> {
  final SearchRepository searchRepository;

  GetListSearchTickets({required this.searchRepository});
  @override
  Future<Either<Failure, List<Search>>> call(params) async =>
      await searchRepository.getListSearchTickets();
}
