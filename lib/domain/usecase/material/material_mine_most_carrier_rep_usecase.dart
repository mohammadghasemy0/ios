import 'package:dartz/dartz.dart';
import '../../model/model.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialMostCarrierRepUseCase implements BaseUseCase<MaterialMostCarrierRepRequest, List<MaterialMineMostCarrierRep>> {
  final Repository _repository;
  MaterialMostCarrierRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialMineMostCarrierRep>>> execute(MaterialMostCarrierRepRequest input) async{
    return await _repository.materialMostCarrierRep(input);
  }

}