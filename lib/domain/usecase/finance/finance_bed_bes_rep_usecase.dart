import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class FinanceBedBesRepUseCase implements BaseUseCase<FinancialBedBesRepRequest, FinancialBedBesRep?> {
  final Repository _repository;
  FinanceBedBesRepUseCase(this._repository);

  @override
  Future<Either<Failure, FinancialBedBesRep?>> execute(input) async{
    return await _repository.financialBedBesReport(input);
  }

}