import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialIncomingRepByProductUseCase implements BaseUseCase<MaterialIncomingRepByProductRequest, List<MaterialIncomingRepByProduct>> {
  final Repository _repository;
  MaterialIncomingRepByProductUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialIncomingRepByProduct>>> execute(MaterialIncomingRepByProductRequest input) async{
    return await _repository.materialIncomingRepByProduct(input);
  }

}