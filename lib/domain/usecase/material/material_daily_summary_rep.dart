import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialDailySummaryRepUseCase implements BaseUseCase<MaterialDailySummaryRepRequest, MaterialDailySummaryRep> {
  final Repository _repository;
  MaterialDailySummaryRepUseCase(this._repository);

  @override
  Future<Either<Failure, MaterialDailySummaryRep>> execute(MaterialDailySummaryRepRequest input) async{
    return await _repository.materialDailySummaryRep(input);
  }

}