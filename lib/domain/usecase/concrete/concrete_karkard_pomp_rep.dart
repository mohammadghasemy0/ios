import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteKarkardPompRepUseCase
    implements
        BaseUseCase<ConcretePompKarkardPompRepRequest,
            List<ConcretePompKarkardPompRep>?> {
  final Repository _repository;

  ConcreteKarkardPompRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcretePompKarkardPompRep>?>> execute(
      input) async {
    return await _repository.concretePompKarkardPompRep(input);
  }
}
