import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialIncomingRepByCustomerAndProductUseCase implements BaseUseCase<MaterialIncomingRepByCustomerAndProductRequest, List<MaterialIncomingRepByCustomerAndProduct>> {
  final Repository _repository;
  MaterialIncomingRepByCustomerAndProductUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialIncomingRepByCustomerAndProduct>>> execute(MaterialIncomingRepByCustomerAndProductRequest input) async{
    return await _repository.materialIncomingRepByCustomerAndProduct(input);
  }

}