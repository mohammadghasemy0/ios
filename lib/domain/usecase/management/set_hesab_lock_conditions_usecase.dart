import 'package:dartz/dartz.dart';
import '/data/request/customer_api_request.dart';
import '/data/network/failure.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class SetHesabLockConditionsUseCase implements BaseUseCase<ManagementSetHesabLockConditionsRequest, String> {
  final Repository _repository;

  SetHesabLockConditionsUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(ManagementSetHesabLockConditionsRequest input) async =>
      await _repository.managementSetHesabLockConditions(input);
}
