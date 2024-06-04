import 'package:dartz/dartz.dart';
import 'package:keliling_pontianak/core/error/failure.dart';
import 'package:keliling_pontianak/feature/select_flow/data/data_source/select_data_source.dart';
import 'package:keliling_pontianak/feature/select_flow/data/models/location_data_models.dart';
import 'package:keliling_pontianak/feature/select_flow/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final SelectDataSource selectDataSource = SelectDataSourceImpl();

  @override
  Future<Either<Failure, List<LocationModels>>> getData(
    String collection,
  ) async {
    try {
      final result = await selectDataSource.getData(collection);
      return Right(result);
    } catch (e) {
      return Left(
        DataFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
