import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class SaleDailySummaryRepUseCase implements BaseUseCase<SaleDailySummaryRepRequest, SaleDailySummaryRep> {
  final Repository _repository;
  SaleDailySummaryRepUseCase(this._repository);

  @override
  Future<Either<Failure, SaleDailySummaryRep>> execute(SaleDailySummaryRepRequest input) async{
    return await _repository.saleDailySummaryRep(input);
  }

}