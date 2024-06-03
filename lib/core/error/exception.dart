import 'package:equatable/equatable.dart';

interface class Exeption extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerException extends Exeption {}

class CacheException extends Exeption {}
