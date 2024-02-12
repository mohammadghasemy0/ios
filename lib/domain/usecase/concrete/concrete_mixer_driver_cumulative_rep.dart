import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteMixerDriverDetailedRepUseCase
    implements
        BaseUseCase<ConcreteMixerDriverDetailedRepRequest,
            List<ConcreteMixerDriverDetailedRep>?> {
  final Repository _repository;

  ConcreteMixerDriverDetailedRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcreteMixerDriverDetailedRep>?>> execute(
      input) async {
    return await _repository.concreteMixerDriverDetailedRep(input);
  }
}
