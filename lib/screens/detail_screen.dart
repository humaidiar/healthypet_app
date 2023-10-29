import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthypet_app/components/back_app_bar.dart';
import 'package:healthypet_app/models/doctor_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.doctors});
  final DoctorModel doctors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
          child: itemCard(),
        ));
  }

  Column itemCard() {
    return Column(
      children: [
        Container(
          height: 500,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF35385A).withOpacity(.12),
                    blurRadius: 30,
                    offset: const Offset(0, 2))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Image.asset(
                      'assets/images/${doctors.image}',
                      width: 100,
                      height: 100,
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
                          doctors.name,
                          style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF3F3E3F)),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Service: ${doctors.services.join(', ')}",
                                style: GoogleFonts.manrope(
                                    fontSize: 14, color: Colors.black))),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            const Icon(
                              FeatherIcons.mapPin,
                              size: 14,
                              color: Color(0xFFACA3A3),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              "${doctors.distance} km",
                              style: GoogleFonts.manrope(
                                  fontSize: 14, color: const Color(0xFFACA3A3)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: GoogleFonts.manrope(
                        fontSize: 14,
                        height: 1.5,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(.5)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    doctors.description,
                    style: GoogleFonts.manrope(
                        fontSize: 15,
                        height: 1.5,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.4)),
                  ),
                ],
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
        ),
      ],
    );
  }
}
