import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class MaterialMineTransportToSaleRatioReportUseCase implements BaseUseCase<MaterialMineTransportToSaleRatioReportRequest, MaterialMineTransportToSaleRatioReport> {
  final Repository _repository;
  MaterialMineTransportToSaleRatioReportUseCase(this._repository);

  @override
  Future<Either<Failure, MaterialMineTransportToSaleRatioReport>> execute(MaterialMineTransportToSaleRatioReportRequest input) async{
    return await _repository.materialMineTransportToSaleRatioReport(input);
  }

}