import 'package:dartz/dartz.dart';
import '../model/model.dart';
import '/data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AccessListUseCase implements BaseUseCase<void, List<Company>> {
  final Repository _repository;

  AccessListUseCase(this._repository);

  @override
  Future<Either<Failure, List<Company>>> execute(void input) async =>
      await _repository.getKianoAccessListCompany();
}
