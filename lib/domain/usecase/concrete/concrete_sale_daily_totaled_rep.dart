import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteSaleDailyTotaledRepUseCase implements BaseUseCase<ConcreteSalesDailyTotaledRepRequest, List<ConcreteSalesDailyTotaledRep>?> {
  final Repository _repository;
  ConcreteSaleDailyTotaledRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcreteSalesDailyTotaledRep>?>> execute(input) async{
    return await _repository.concreteSalesDailyTotaledRep(input);
  }
}