import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keliling_pontianak/core/error/failure.dart';
import 'package:keliling_pontianak/feature/login/data/repository/auth_repository_impl.dart';
import 'package:keliling_pontianak/feature/login/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository = AuthRepositoryImpl();

  Future<Either<Failure, User?>> login(String email, String password) async {
    return await authRepository.login(email, password);
  }

  Future<Either<Failure, void>> logOut() async {
    return await authRepository.logOut();
  }
}
