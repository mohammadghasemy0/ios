import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class FinanceDailySummaryRepUseCase implements BaseUseCase<FinanceDailySummaryRepRequest, FinanceDailySummaryRep> {
  final Repository _repository;
  FinanceDailySummaryRepUseCase(this._repository);

  @override
  Future<Either<Failure, FinanceDailySummaryRep>> execute(FinanceDailySummaryRepRequest input) async{
    return await _repository.financeDailySummaryRep(input);
  }

}