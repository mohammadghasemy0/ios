import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialIncomingRepByCarUseCase implements BaseUseCase<MaterialIncomingRepByCarRequest, List<MaterialIncomingRepByCar>> {
  final Repository _repository;
  MaterialIncomingRepByCarUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialIncomingRepByCar>>> execute(MaterialIncomingRepByCarRequest input) async{
    return await _repository.materialIncomingRepByCar(input);
  }

}