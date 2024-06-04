import 'package:dartz/dartz.dart';
import 'package:keliling_pontianak/core/error/failure.dart';
import 'package:keliling_pontianak/feature/select_flow/data/models/location_data_models.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<LocationModels>>> getData(String collection);
}
