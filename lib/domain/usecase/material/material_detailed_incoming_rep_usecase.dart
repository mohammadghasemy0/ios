import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialDetailedIncomingRepUseCase implements BaseUseCase<MaterialDetailedIncomingRepRequest, List<MaterialDetailedIncomingRep>> {
  final Repository _repository;
  MaterialDetailedIncomingRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialDetailedIncomingRep>>> execute(MaterialDetailedIncomingRepRequest input) async{
    return await _repository.materialDetailedIncomingRep(input);
  }

}