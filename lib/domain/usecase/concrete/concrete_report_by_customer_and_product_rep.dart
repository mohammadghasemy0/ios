import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteReportByCustomerAndProductRepUseCase
    implements
        BaseUseCase<ConcreteReportByCustomerAndProductRequest,
            List<ConcreteReportByCustomerAndProduct>?> {
  final Repository _repository;

  ConcreteReportByCustomerAndProductRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcreteReportByCustomerAndProduct>?>> execute(input) async {
    return await _repository.concreteReportByCustomerAndProduct(input);
  }
}
