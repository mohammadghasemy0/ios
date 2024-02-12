import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialBillRepByCustomerUseCase implements BaseUseCase<MaterialBillRepByCustomerRequest, List<MaterialBillRepByCustomer>> {
  final Repository _repository;
  MaterialBillRepByCustomerUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialBillRepByCustomer>>> execute(MaterialBillRepByCustomerRequest input) async{
    return await _repository.materialBillRepByCustomer(input);
  }

}