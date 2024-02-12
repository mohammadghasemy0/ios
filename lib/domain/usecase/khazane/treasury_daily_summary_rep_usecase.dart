import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class TreasuryDailySummaryRepUseCase implements BaseUseCase<TreasuryDailySummaryRepRequest, TreasuryDailySummaryRep> {
  final Repository _repository;
  TreasuryDailySummaryRepUseCase(this._repository);

  @override
  Future<Either<Failure, TreasuryDailySummaryRep>> execute(TreasuryDailySummaryRepRequest input) async{
    return await _repository.treasuryDailySummaryRep(input);
  }

}