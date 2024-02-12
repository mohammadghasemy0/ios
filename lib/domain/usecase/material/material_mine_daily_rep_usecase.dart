import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialMineDailyRepUseCase implements BaseUseCase<MaterialMineDailyRepRequest, List<MaterialMineDailyRep>> {
  final Repository _repository;
  MaterialMineDailyRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<MaterialMineDailyRep>>> execute(MaterialMineDailyRepRequest input) async{
    return await _repository.materialMineDailyRep(input);
  }

}