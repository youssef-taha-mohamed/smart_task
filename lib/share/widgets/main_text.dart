import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart/core/styles/colors.dart';

class MainText extends StatelessWidget {
  const MainText(this.text, {
    super.key,
    this.color = AppColors.black,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.fontFamily,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontStyle,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  // final

  /// this is style for title for all app with size=16 and fontWeight=700
  const MainText.heading(this.text, {
    super.key,
    this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.fontFamily,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontStyle,
  });

  /// this is style for title for all app with size=14, color=grey and fontWeight=400
  const MainText.subHeading(this.text, {
    super.key,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w700,
    this.fontFamily,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontStyle,
  });

  /// this is style for title for all app with size=14,color=white and fontWeight=700
  const MainText.txtButton(this.text, {
    super.key,
    this.color,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.fontFamily,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.cairo(
        decoration: decoration,
        color: color ?? AppColors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}