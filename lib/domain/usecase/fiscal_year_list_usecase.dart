import 'package:dartz/dartz.dart';
import '../model/model.dart';
import '/data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class FiscalYearListUseCase implements BaseUseCase<String, List<FiscalYear>> {
  final Repository _repository;

  FiscalYearListUseCase(this._repository);

  @override
  Future<Either<Failure, List<FiscalYear>>> execute(String address) async =>
      await _repository.getCompanyFiscalYear(address);
}