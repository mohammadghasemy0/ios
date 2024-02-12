import 'package:dartz/dartz.dart';
import 'package:kiano/data/request/customer_api_request.dart';
import '../../model/model.dart';
import '/data/network/failure.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class ManagementLockHesabUseCase implements BaseUseCase<ManagementLockHesabRequest, String?> {
  final Repository _repository;

  ManagementLockHesabUseCase(this._repository);

  @override
  Future<Either<Failure, String?>> execute(input) async =>
      await _repository.managementLockHesab(input);
}
