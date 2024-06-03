import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

enum AppRoute {
  loginScreen,
  homeScreen,
  destinationScreen,
  locationScreen,
  guideScreen,
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.loginScreen.name,
        builder: (context, state) {
          return Container();
        },
      ),
      GoRoute(
        path: '/home',
        name: AppRoute.homeScreen.name,
        builder: (context, state) {
          return Container();
        },
        routes: [
          GoRoute(
            path: 'location',
            name: AppRoute.locationScreen.name,
            builder: (context, state) {
              return Container();
            },
            routes: [
              GoRoute(
                path: 'guide',
                name: AppRoute.guideScreen.name,
                builder: (context, state) {
                  return Container();
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
