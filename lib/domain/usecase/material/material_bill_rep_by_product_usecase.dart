import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialBillRepByProductUseCase implements BaseUseCase<MaterialBillRepByProductRequest, List<MaterialBillRepByProduct>> {
  final Repository _repository;
  MaterialBillRepByProductUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialBillRepByProduct>>> execute(MaterialBillRepByProductRequest input) async{
    return await _repository.materialBillRepByProduct(input);
  }

}