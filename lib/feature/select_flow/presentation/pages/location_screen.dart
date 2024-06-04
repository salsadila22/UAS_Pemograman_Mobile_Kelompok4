import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keliling_pontianak/core/widgets/menu_widget.dart';
import 'package:keliling_pontianak/feature/select_flow/domain/entity/location.dart';
import 'package:keliling_pontianak/feature/select_flow/presentation/pages/guide_screen.dart';
import 'package:keliling_pontianak/main.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationScreenParam {
  final List<Location> location;

  LocationScreenParam(this.location);
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.location});

  final LocationScreenParam location;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<Location>? data;

  @override
  void initState() {
    data = widget.location.location;
    super.initState();
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
            child: Image.asset("assets/images/login/tugu khatulistiwa.png"),
          ),
          Container(
            width: 360.w,
            height: 690.h,
            decoration: const BoxDecoration(
              color: Color.fromARGB(121, 41, 41, 41),
            ),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 100.h,
              ),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return MenuWidgets(
                  name: data![index].name!,
                  desc: data![index].desc,
                  function: () {
                    if (data![index].directGuide != null) {
                      return openMap(data![index].directGuide!);
                    }
                    return context.pushNamed(
                      AppRoute.guideScreen.name,
                      extra: GuideScreenParam(data![index].guide!),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
