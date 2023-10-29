import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthypet_app/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Top UI bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    //Navigate to HomeScreen with delay (Can not go back to previous one by slide left)
    // Future.delayed(const Duration(seconds: 3)).then((value) => {
    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(
    //             builder: (context) => const HomeScreen(),
    //           ),
    //           (route) => false)
    //     });
    //Content
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/images/Background.png'),
        Center(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 22,
              ),
              const SizedBox(
                height: 100,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  //calling the text
                  text: TextSpan(
                      text: "Helping you\nto keep",
                      style: GoogleFonts.manrope(
                          fontSize: 25,
                          color: const Color(0xFFDEE1FE),
                          letterSpacing: 20 / 100,
                          height: 152 / 100),
                      children: const [
                        TextSpan(
                            text: " your bestie",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        TextSpan(text: "\nstay healthy")
                      ])),
              const SizedBox(
                height: 420,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.manrope(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF3F3E3F)),
                    )),
              )
            ],
          )),
        )
      ],
    ));
  }
}
