import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';
import '../../model/model.dart';

class MaterialMineMonthlyRepUseCase implements BaseUseCase<MaterialMineMonthlyRepRequest, List<MaterialMineMonthlyRep>> {
  final Repository _repository;
  MaterialMineMonthlyRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialMineMonthlyRep>>> execute(MaterialMineMonthlyRepRequest input) async{
    return await _repository.materialMineMonthlyRep(input);
  }

}