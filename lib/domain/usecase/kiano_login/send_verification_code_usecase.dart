import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class SendVerificationCodeUseCase implements BaseUseCase<String, bool> {
  final Repository _repository;

  SendVerificationCodeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(String input) async =>
      await _repository.sendVerificationCode(input);
}
