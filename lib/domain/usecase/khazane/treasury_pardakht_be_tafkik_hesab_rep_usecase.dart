import 'package:dartz/dartz.dart';
import '../../model/model.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';

class TreasuryPardakhtBeTafkikHesabRepUseCase implements BaseUseCase<TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest, List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>?> {
  final Repository _repository;
  TreasuryPardakhtBeTafkikHesabRepUseCase(this._repository);

  @override
  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>?>> execute(TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest input) async{
    return await _repository.treasuryPardakhtBeTafkikHesabRep(input);
  }

}