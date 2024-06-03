abstract class Failure implements Exception {
  String? title;
  String? message;

  Failure({this.title, this.message});
}

class AuthFailure extends Failure {
  AuthFailure({super.message})
      : super(
          title: "Auth failed!",
        );
}

class DataFailure extends Failure {
  DataFailure({super.message})
      : super(
          title: "Data failure!",
        );
}
