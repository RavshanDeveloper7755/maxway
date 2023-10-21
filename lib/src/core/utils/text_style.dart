import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyle {
  AppStyle._();

  static TextStyle get SFProDisplay24xW500White => GoogleFonts.abel(
    textStyle:  TextStyle(
      fontSize: 15.sp,
      color: AppColors.defaultblack,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: ".SF Pro Display"
    ),
  );

}