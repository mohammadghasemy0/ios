import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class BasculeDailySummaryRepUseCase implements BaseUseCase<BasculeDailySummaryRepRequest, BasculeDailySummaryRep> {
  final Repository _repository;
  BasculeDailySummaryRepUseCase(this._repository);

  @override
  Future<Either<Failure, BasculeDailySummaryRep>> execute(BasculeDailySummaryRepRequest input) async{
    return await _repository.basculeDailySummaryRep(input);
  }

}