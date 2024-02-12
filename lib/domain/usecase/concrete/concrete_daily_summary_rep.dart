import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteDailySummaryRepUseCase implements BaseUseCase<ConcreteDailySummaryRepRequest, ConcreteDailySummaryRep> {
  final Repository _repository;
  ConcreteDailySummaryRepUseCase(this._repository);

  @override
  Future<Either<Failure, ConcreteDailySummaryRep>> execute(ConcreteDailySummaryRepRequest input) async{
    return await _repository.concreteDailySummaryRep(input);
  }

}