import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class FinanceGozareshHesabUseCase implements BaseUseCase<FinancialGozareshHesabRepRequest, List<FinancialGozareshHesabRep>?> {
  final Repository _repository;
  FinanceGozareshHesabUseCase(this._repository);

  @override
  Future<Either<Failure, List<FinancialGozareshHesabRep>?>> execute(input) async{
    return await _repository.financialGozareshHesabReport(input);
  }

}