import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class CheckConfirmCodeUseCase implements BaseUseCase<String, bool> {
  final Repository _repository;

  CheckConfirmCodeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(String input) async =>
      await _repository.checkConfirmCode(input);
}
