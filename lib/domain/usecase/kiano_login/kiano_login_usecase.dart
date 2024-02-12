import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class KianoLoginUseCase implements BaseUseCase<void, bool> {
  final Repository _repository;

  KianoLoginUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(void input) async => await _repository.appLogin();
}