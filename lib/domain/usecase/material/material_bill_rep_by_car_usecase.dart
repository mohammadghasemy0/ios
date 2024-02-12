import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialBillRepByCarUseCase implements BaseUseCase<MaterialBillRepByCarRequest, List<MaterialBillRepByCar>> {
  final Repository _repository;
  MaterialBillRepByCarUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialBillRepByCar>>> execute(MaterialBillRepByCarRequest input) async{
    return await _repository.materialBillRepByCar(input);
  }

}