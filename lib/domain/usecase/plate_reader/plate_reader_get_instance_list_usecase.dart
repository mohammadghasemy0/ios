import 'package:dartz/dartz.dart';
import '/data/network/failure.dart';
import '/data/request/customer_api_request.dart';
import '/domain/repository/repository.dart';
import '../../model/model.dart';
import '/domain/usecase/base_usecase.dart';

class PlateReaderGetInstanceList
    implements
        BaseUseCase< void,
            List<PlateReaderInstanceList>?> {
  final Repository _repository;

  PlateReaderGetInstanceList(this._repository);

  @override
  Future<Either<Failure, List<PlateReaderInstanceList>?>> execute(Void) async {
    return await _repository.plateReaderGetInstanceList();
  }
}
