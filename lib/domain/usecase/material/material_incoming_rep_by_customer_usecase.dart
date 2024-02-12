import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialIncomingRepByCustomerUseCase implements BaseUseCase<MaterialIncomingRepByCustomerRequest, List<MaterialIncomingRepByCustomer>> {
  final Repository _repository;
  MaterialIncomingRepByCustomerUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialIncomingRepByCustomer>>> execute(MaterialIncomingRepByCustomerRequest input) async{
    return await _repository.materialIncomingRepByCustomer(input);
  }

}