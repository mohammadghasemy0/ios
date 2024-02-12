import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteOrdersInDayRepUseCase implements BaseUseCase<ConcreteOrdersInDayRepRequest, List<ConcreteOrdersInDayRep>?> {
  final Repository _repository;
  ConcreteOrdersInDayRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcreteOrdersInDayRep>?>> execute(input) async{
    return await _repository.concreteOrdersInDayReport(input);
  }

}