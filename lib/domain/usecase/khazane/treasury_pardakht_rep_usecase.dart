import 'package:dartz/dartz.dart';
import '../../model/model.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';

class TreasuryPardakhtRepUseCase implements BaseUseCase<TreasuryDaryaftAndPardakhtRepRequest, List<TreasuryDaryaftAndPardakhtRep>?> {
  final Repository _repository;
  TreasuryPardakhtRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtRep>?>> execute(TreasuryDaryaftAndPardakhtRepRequest input) async{
    return await _repository.treasuryPardakhtRep(input);
  }

}