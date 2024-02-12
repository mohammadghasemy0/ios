import 'package:dartz/dartz.dart';
import '../../data/request/customer_api_request.dart';
import '/data/network/failure.dart';
import '../model/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class HesabTafsiliUseCase implements BaseUseCase<TafsiliRequest, List<Tafsili>> {
  final Repository _repository;

  HesabTafsiliUseCase(this._repository);

  @override
  Future<Either<Failure, List<Tafsili>>> execute(TafsiliRequest input) async =>
      _repository.getHesabTafsiliList(input);
}
