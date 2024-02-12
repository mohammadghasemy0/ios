import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/model/model.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';

class FiscalYearDataBaseAuthUseCase
    extends BaseUseCase<FiscalYearLoginData, bool> {
  final Repository _repository;

  FiscalYearDataBaseAuthUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(FiscalYearLoginData input) async {
    return await _repository.fiscalYearDataBaseAuth(
        FiscalYearDataBaseAuthRequest(
            input.username, input.password, input.dbName));
  }
}
