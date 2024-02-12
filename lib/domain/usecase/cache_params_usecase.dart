import 'package:dartz/dartz.dart';
import '../../data/request/customer_api_request.dart';
import '/data/network/failure.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class CacheParamsUseCase implements BaseUseCase<String, CacheParams> {
  final Repository _repository;

  CacheParamsUseCase(this._repository);

  @override
  Future<Either<Failure, CacheParams>> execute(String input) async =>
      _repository.getCacheParams(CacheParamsRequest([
        "anbar",
        "goroohTafsili",
        "madan",
        "moin",
        "markazHazineh",
        "customer",
        "product",
        "pomp",
        "car",
        "beton_work_type",
        "beton_sharayet_mohiti",
      ], input));
}
