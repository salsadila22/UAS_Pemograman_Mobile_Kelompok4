import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keliling_pontianak/feature/login/domain/usecase/login_usecase.dart';
import 'package:keliling_pontianak/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginUsecase loginUsecase = LoginUsecase();

  bool isLoading = false;
  String? errorMessage;
  bool obsecure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.yellow,
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xFFBDFF00),
        centerTitle: true,
        title: Text(
          "Keliling Pontianak",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 30.w,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            child: Image.asset(
              'assets/images/login/tugu bambu-login.png',
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/login/tugu khatulistiwa.png",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration.collapsed(
                      hintText: "Masukkan email",
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                        obscureText: obsecure,
                        controller: passwordController,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Masukkan password",
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: obsecure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_sharp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              "Login",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.w,
                              ),
                            ),
                    ),
                  ),
                  onTap: () {
                    login(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  login(String email, String password) async {
    try {
      final result = await loginUsecase.login(email, password);

      result.fold(
        (l) => setState(() {
          errorMessage = l.message;
        }),
        (r) => context.pushReplacementNamed(AppRoute.homeScreen.name),
      );
    } catch (e) {
      setState(() {
        errorMessage = "An unexpected error occur!";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
