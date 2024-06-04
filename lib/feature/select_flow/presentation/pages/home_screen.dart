import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keliling_pontianak/core/widgets/menu_widget.dart';
import 'package:keliling_pontianak/feature/select_flow/data/models/location_data_models.dart';
import 'package:keliling_pontianak/feature/select_flow/domain/usecase/get_location_usecase.dart';
import 'package:keliling_pontianak/feature/select_flow/presentation/pages/location_screen.dart';
import 'package:keliling_pontianak/main.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetDataUsecase getDataUsecase = GetDataUsecase();

  List<LocationModels>? data;
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    getData("lokasi");
    super.initState();
  }

  getData(String collection) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    final result = await getDataUsecase.execute(collection);
    try {
      result.fold(
        (l) => setState(() {
          errorMessage = l.message;
          log(errorMessage!);
        }),
        (r) {
          setState(() {
            data = r;
            isLoading = false;
          });
        },
      );
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
        isLoading = false;
      });
    }
  }

  openMap(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
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
            left: -150.w,
            bottom: -75.h,
            child: Image.asset(
              "assets/images/login/tugu bambu-login.png",
              scale: 1.1,
            ),
          ),
          Container(
            width: 360.w,
            height: 690.h,
            decoration: const BoxDecoration(
              color: Color.fromARGB(121, 41, 41, 41),
            ),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 100.h,
                      ),
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        return MenuWidgets(
                          name: data![index].name!,
                          function: () {
                            if (data![index].location != null) {
                              return context.pushNamed(
                                AppRoute.locationScreen.name,
                                extra:
                                    LocationScreenParam(data![index].location!),
                              );
                            }
                            return openMap(data![index].directLocation!);
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
