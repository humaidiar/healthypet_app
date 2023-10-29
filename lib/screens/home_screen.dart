import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthypet_app/models/doctor_model.dart';
import 'package:healthypet_app/screens/detail_screen.dart';

import '../models/service_model.dart';

var selectedService = 0; // hard-code for navigatorbottom icon
var menus = {
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user,
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    //Content
    return Scaffold(
        bottomNavigationBar: bottomNavigator(),
        body: SafeArea(
            child: SingleChildScrollView(
          // make sure the overflow
          child: Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              greetingCard(),
              const SizedBox(
                height: 22,
              ),
              cardDisplay(),
              const SizedBox(
                height: 22,
              ),
              searchBar(),
              const SizedBox(
                height: 22,
              ),
              serviceData(),
              const SizedBox(
                height: 22,
              ),
              listDoctor()
            ],
          ),
        )));
  }

  BottomNavigationBar bottomNavigator() => BottomNavigationBar(
        selectedItemColor: const Color(0xFF818AF9),
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        unselectedItemColor: const Color(0xFFBFBFBF),
        iconSize: 25,
      );

  ListView listDoctor() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            singleDoctor(doctorsList[index], context),
        separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
        itemCount: doctorsList.length);
  }

  //List of Items from the Model
  GestureDetector singleDoctor(DoctorModel doctorModel, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(doctors: doctorModel)));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF35385A).withOpacity(.12),
                  blurRadius: 30,
                  offset: const Offset(0, 2))
            ]),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                'assets/images/${doctorModel.image}',
                width: 88,
                height: 90,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              // use for in tight spacing , column
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorModel.name,
                    style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3F3E3F)),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Service: ${doctorModel.services.join(', ')}",
                          style: GoogleFonts.manrope(
                              fontSize: 12, color: Colors.black))),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      const Icon(
                        FeatherIcons.mapPin,
                        size: 10,
                        color: Color(0xFFACA3A3),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        "${doctorModel.distance} km",
                        style: GoogleFonts.manrope(
                            fontSize: 12, color: const Color(0xFFACA3A3)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Available for",
                        style: GoogleFonts.manrope(
                            fontSize: 12,
                            color: const Color(0xFF50CC98),
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/svgs/cat.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset('assets/svgs/dog.svg')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox serviceData() {
    return SizedBox(
      height: 45,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: selectedService == index
                        ? const Color(0xFF818AF9)
                        : const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    // Could be used buttonStyle
                    child: Text(
                  Service.all()[index],
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: selectedService == index
                        ? Colors.white
                        : const Color(0xFF3F3E3F).withOpacity(0.3),
                  ),
                )),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 12,
              ),
          itemCount: Service.all().length),
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              FeatherIcons.search,
              color: Color(0XFFADACAD),
            ),
            hintText: "Find best vaccinate, treatment...",
            hintStyle: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFCACACA),
                height: 150 / 100)),
      ),
    );
  }

  AspectRatio cardDisplay() {
    return AspectRatio(
      aspectRatio: 336 /
          184, // Using Aspect Ratio, to make sure the same ration on all devices
      child: Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF818Af9)),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg-2.png',
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                    //positioning the content to the left and centre
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          //calling the text
                          text: TextSpan(
                              text: "Your",
                              style: GoogleFonts.manrope(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 50 / 100,
                                  height: 152 / 100),
                              children: const [
                            TextSpan(
                                text: " Jerry",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),
                            TextSpan(text: " will get\nvaccination"),
                            TextSpan(
                                text: " tomorrow\nat 07.00 am!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),
                          ])),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.2)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "See Details",
                          style: GoogleFonts.manrope(
                              color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ]),
              )
            ],
          )),
    );
  }

  Padding greetingCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Human!",
            style:
                GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          Stack(children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.shoppingBag,
                  color: Color(0xFF818AF9),
                  size: 25,
                )),
            Positioned(
              // Count number position and wrapped
              right: 6,
              top: 6,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: const Color(0xFFEF6497),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    // Count number cart
                    child: Text(
                  '0',
                  style: GoogleFonts.mPlus1(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 9),
                )),
              ),
            )
          ])
        ],
      ),
    );
  }
}
