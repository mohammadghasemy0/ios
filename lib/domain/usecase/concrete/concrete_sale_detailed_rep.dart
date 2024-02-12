import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteSaleDetailedRepUseCase implements BaseUseCase<ConcreteSaleDetailedRepRequest, List<ConcreteSaleDetailedRep>?> {
  final Repository _repository;
  ConcreteSaleDetailedRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcreteSaleDetailedRep>?>> execute(input) async{
    return await _repository.concreteSaleDetailedReport(input);
  }

}