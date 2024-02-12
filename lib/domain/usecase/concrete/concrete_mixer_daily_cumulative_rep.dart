import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class ConcreteMixerDailyCumulativeRepUseCase
    implements
        BaseUseCase<ConcreteMixerDailyCumulativeRepRequest,
            List<ConcreteMixerDailyCumulativeRep>?> {
  final Repository _repository;

  ConcreteMixerDailyCumulativeRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<ConcreteMixerDailyCumulativeRep>?>> execute(
      input) async {
    return await _repository.concreteMixerDailyCumulativeRep(input);
  }
}
