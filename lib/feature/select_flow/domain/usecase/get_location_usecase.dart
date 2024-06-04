import 'package:dartz/dartz.dart';
import 'package:keliling_pontianak/core/error/failure.dart';
import 'package:keliling_pontianak/feature/select_flow/data/models/location_data_models.dart';
import 'package:keliling_pontianak/feature/select_flow/data/repository/location_repository_impl.dart';
import 'package:keliling_pontianak/feature/select_flow/domain/repository/location_repository.dart';

class GetDataUsecase {
  final LocationRepository locationRepository = LocationRepositoryImpl();

  Future<Either<Failure, List<LocationModels>>> execute(
    String collection,
  ) async {
    return await locationRepository.getData(collection);
  }
}
