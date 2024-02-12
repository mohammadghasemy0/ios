import 'package:dartz/dartz.dart';
import '../../model/model.dart';
import '/data/network/failure.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class GetHesabLockConditionsUseCase implements BaseUseCase<String, GetHesabLockConditions> {
  final Repository _repository;

  GetHesabLockConditionsUseCase(this._repository);

  @override
  Future<Either<Failure, GetHesabLockConditions>> execute(input) async =>
      await _repository.managementGetHesabLockConditions(input);
}
