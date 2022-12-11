// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/utils/app_constants.dart';
import 'package:mental/widgets/text_widget.dart';

Widget loginWidget() {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          text: AppConstants.helloNiceToMeetYou,
        ),
        textWidget(
            text: AppConstants.getMovingWithGreenTaxi,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 25,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
              children: [
                const TextSpan(
                  text: AppConstants.byCreating + "   ",
                ),
                TextSpan(
                  text: AppConstants.termsOfService,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: AppConstants.privacyPolicy + "   ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
