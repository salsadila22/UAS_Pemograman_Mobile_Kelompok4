import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keliling_pontianak/feature/login/presentation/pages/login_screen.dart';
import 'package:keliling_pontianak/feature/select_flow/presentation/pages/guide_screen.dart';
import 'package:keliling_pontianak/feature/select_flow/presentation/pages/home_screen.dart';
import 'package:keliling_pontianak/feature/select_flow/presentation/pages/location_screen.dart';
import 'package:keliling_pontianak/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//Name of your application's route
enum AppRoute {
  loginScreen,
  homeScreen,
  locationScreen,
  guideScreen,
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //Routes for your Application
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.loginScreen.name,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/home',
        name: AppRoute.homeScreen.name,
        builder: (context, state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: 'location',
            name: AppRoute.locationScreen.name,
            builder: (context, state) {
              final param = state.extra as LocationScreenParam;
              return LocationScreen(
                location: param,
              );
            },
            routes: [
              GoRoute(
                path: 'guide',
                name: AppRoute.guideScreen.name,
                builder: (context, state) {
                  final param = state.extra as GuideScreenParam;
                  return GuideScreen(
                    guide: param,
                  );
                },
              )
            ],
          ),
        ],
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
