import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteAddOrderUseCase implements BaseUseCase<ConcreteAddOrderRequest, String?> {
  final Repository _repository;
  ConcreteAddOrderUseCase(this._repository);

  @override
  Future<Either<Failure, String?>> execute(ConcreteAddOrderRequest input) async{
    return await _repository.concreteAddOrder(input);
  }

}