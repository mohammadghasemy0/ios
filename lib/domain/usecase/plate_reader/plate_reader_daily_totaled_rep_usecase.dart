import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class PlateReaderDailyTotaledRepUseCase
    implements
        BaseUseCase<PlateReaderDetailedAndDailyTotaledRepRequest,
            List<PlateReaderDailyTotaledAndTotaledRep>?> {
  final Repository _repository;

  PlateReaderDailyTotaledRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<PlateReaderDailyTotaledAndTotaledRep>?>> execute(
      PlateReaderDetailedAndDailyTotaledRepRequest input) async {
    return await _repository.plateReaderDailyTotaledRep(input);
  }
}
