import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/utils/app_colors.dart';

Widget greenIntroWidget() {
  return Container(
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/mask.png'),
        fit: BoxFit.cover,
      ),
    ),
    height: Get.height * 0.6,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/leaf icon.svg',
          color: AppColors.blackColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Doctor health Care',
          style: GoogleFonts.poppins(
            fontSize: 25,
          ),
        ),
      ],
    ),
  );
}
