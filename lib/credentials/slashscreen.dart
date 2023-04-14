import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/credentials/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Image(image: AssetImage("assets/img.png")),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Amazing app for customers all around",
              style:
                  GoogleFonts.arima(fontSize: 25, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
            OutlinedButton(
              onPressed: () {
             Get.to(const Signup(),
             transition: Transition.leftToRightWithFade,
                 duration:const Duration(seconds: 1)
             );
              },
              style: OutlinedButton.styleFrom(
                elevation: 20,
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)))),
              child: Text(
                "Get Started",
                style: GoogleFonts.arima(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
