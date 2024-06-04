import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keliling_pontianak/core/widgets/guide_menu_widget.dart';
import 'package:keliling_pontianak/feature/select_flow/domain/entity/guide.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GuideScreenParam {
  final List<Guide> guide;

  GuideScreenParam(this.guide);
}

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key, required this.guide});

  final GuideScreenParam guide;

  @override
  State<GuideScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<GuideScreen> {
  List<Guide>? data;

  String formattedPhoneNumber = '';

  @override
  void initState() {
    data = widget.guide.guide;
    super.initState();
  }

  openWhatsapp(String phoneNumber) async {
    formatPhoneNumber(phoneNumber);

    final url =
        "https://api.whatsapp.com/send/?phone=$formattedPhoneNumber&text&type=phone_number&app_absent=0";
    if (await canLaunchUrlString(url)) {
      launchUrlString(
        url,
        mode: LaunchMode.inAppBrowserView,
      );
    }
  }

  formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.isNotEmpty) {
      String firstDigit = phoneNumber.substring(0, 1);
      if (firstDigit == "0") {
        String newPhoneNumber = '62${phoneNumber.substring(1)}';
        setState(() {
          formattedPhoneNumber = newPhoneNumber;
        });
      }
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
                vertical: 20.h,
              ),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return GuideMenuWidget(
                  name: data![index].name!,
                  function: () {
                    openWhatsapp(data![index].noHp!);
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
