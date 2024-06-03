import 'package:dartz/dartz.dart';
import 'package:effective_mobile/core/error/failure.dart';
import 'package:effective_mobile/core/usecase/usecase.dart';
import 'package:effective_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';

class SaveTextFrom extends UseCase<void, FromParams> {
  final HomeRepository homeRepository;

  SaveTextFrom({required this.homeRepository});
  @override
  Future<Either<Failure, void>> call(params) async =>
      await homeRepository.saveTextFrom(params.text);
}

class FromParams extends Equatable {
  final String text;

  const FromParams({required this.text});

  @override
  List<Object?> get props => [];
}
