import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteSaleByProductRepUseCase implements BaseUseCase<ConcreteSalesByProductRepRequest, List<ConcreteSalesByProductRep>?> {
  final Repository _repository;
  ConcreteSaleByProductRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcreteSalesByProductRep>?>> execute(input) async{
    return await _repository.concreteSalesByProductRep(input);
  }
}