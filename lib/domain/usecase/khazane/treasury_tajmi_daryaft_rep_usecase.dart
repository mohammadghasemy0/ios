import 'package:dartz/dartz.dart';
import '../../model/model.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';

class TreasuryTajmieiDaryaftRepUseCase
    implements
        BaseUseCase<TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest,
            List<TreasuryGoTajmiDaryaftAndPardakhtRep>?> {
  final Repository _repository;

  TreasuryTajmieiDaryaftRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<TreasuryGoTajmiDaryaftAndPardakhtRep>?>> execute(
      TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest input) async {
    return await _repository.treasuryGoTajmiDaryaftRep(input);
  }
}
