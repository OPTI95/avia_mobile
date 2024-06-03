import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/core/usecase/usecase.dart';
import 'package:effective_mobile/features/home/domain/repositories/home_repository.dart';

class GetSaveTextFrom extends UseCase<String?, NoParams> {
  final HomeRepository homeRepository;

  GetSaveTextFrom({required this.homeRepository});
  @override
  Future<Either<Failure, String?>> call(NoParams params  ) async =>
      await homeRepository.getsaveTextFrom();
}
