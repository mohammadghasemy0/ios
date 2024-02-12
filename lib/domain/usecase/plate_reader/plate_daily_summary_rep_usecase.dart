import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class PlateDailySummaryRepUseCase implements BaseUseCase<PlateDailySummaryRepRequest, PlateDailySummaryRep> {
  final Repository _repository;
  PlateDailySummaryRepUseCase(this._repository);

  @override
  Future<Either<Failure, PlateDailySummaryRep>> execute(PlateDailySummaryRepRequest input) async{
    return await _repository.plateDailySummaryRep(input);
  }

}