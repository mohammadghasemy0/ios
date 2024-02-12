import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class PlateReaderDetailedRepUseCase
    implements
        BaseUseCase<PlateReaderDetailedAndDailyTotaledRepRequest,
            List<PlateReaderDetailedRep>?> {
  final Repository _repository;

  PlateReaderDetailedRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<PlateReaderDetailedRep>?>> execute(
      PlateReaderDetailedAndDailyTotaledRepRequest input) async {
    return await _repository.plateReaderDetailedRep(input);
  }
}
