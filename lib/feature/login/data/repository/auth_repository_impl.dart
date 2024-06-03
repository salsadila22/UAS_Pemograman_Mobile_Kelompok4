import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keliling_pontianak/core/error/failure.dart';
import 'package:keliling_pontianak/feature/login/data/data_post/firebase_auth_data_post.dart';
import 'package:keliling_pontianak/feature/login/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthDataPost authDataPost = AuthDataPostImpl();

  @override
  Future<Either<Failure, User?>> login(String email, String password) async {
    try {
      final result = await authDataPost.login(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(
        AuthFailure(message: e.message),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final result = authDataPost.logOut();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(
        AuthFailure(message: e.message),
      );
    }
  }
}
