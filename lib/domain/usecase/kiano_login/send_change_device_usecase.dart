import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';

class SendChangeDeviceCodeUseCase implements BaseUseCase<void, bool> {
  final Repository _repository;

  SendChangeDeviceCodeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(void input) async => await _repository.sendChangeDeviceCode();

}
