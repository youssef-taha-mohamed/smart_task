import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Colors.blue;
  static const Color red = Colors.red;
  static const Color yellow = Colors.yellow;
  static const Color green = Colors.green;
  static const Color grey = Colors.grey;
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0xFF64B5F6),
      Color(0xFF1976D2),
      Color(0xFF0D47A1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient redGradient = LinearGradient(
    colors: [
      Color(0xFFFF8A80),
      Color(0xFFD32F2F),
      Color(0xFFB71C1C),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient yellowGradient = LinearGradient(
    colors: [
      Color(0xFFFFF59D),
      Color(0xFFFFEB3B),
      Color(0xFFFBC02D),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xFFA5D6A7),
      Color(0xFF4CAF50),
      Color(0xFF2E7D32),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const primaryColor = MaterialColor(
    0xFF1976D2,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF1976D2),
      600: Color(0xFF1565C0),
      700: Color(0xFF0D47A1),
      800: Color(0xFF0B3D91),
      900: Color(0xFF072B61),
    },
  );

  //static const primaryColor = defaultColor;
  static const primarySecondColor = primaryColor;
  static const background = Color(0xFFF4F4F5);
  static const Color darkItemBG = Color(0xFF2B2B2B);
  static const Color darkItemBG2 = Color(0xFF24292D);
  static const Color darkItemBG3 = Color(0xFF0F1116);
  static const Color darkItemBG4 = Color(0xFF1c1f24);

  static const Color amber = Colors.amber;
  static const Color cyan = Colors.cyan;
  static const Color red2 = Color(0xffFC564C);
  static const Color red3 = Color(0xffFCD4D2);
  static const orange = Colors.orange;
  static const Color grey11 = Color(0xffE0E0E0);

  static const Color grey0 = Color(0xffD9D9D9);

  static const Color grey2 = Color(0xffEEEEEE);
  static const Color grey5 = Color(0xff757575);
  static const Color grey6 = Color(0xff808080);
  static const Color grey7 = Color(0xffA6A6A6);
  static const Color grey8 = Color(0xffF2F2F2);
  static const Color grey9 = Color(0xff737373);
  static const Color darkGrey = Color(0xff1B1B1B);
  static const Color whatsapp = Color(0xff1FB35F);
  static const Color accent = Color(0xff00FEEF);
  static const Color yellow2 = Color(0xffFDDB7A);

  static const grey50 = Color(0xFFFAFAFA);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey350 = Color(0xFFD6D6D6);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey500 = Color(0xFF9E9E9E);
  static const grey600 = Color(0xFF757575);
  static const grey700 = Color(0xFF616161);
  static const greyD1 = Color(0xffF8F8F8);
  static const greyD2 = Color(0xffF6F5F0);
  static const greyD3 = Color(0xffA2A2A2);
  static const greyD4 = Color(0xff4D4D4D);
  static const greyD5 = Color(0xffE5E5E5);
  static const greyD6 = Color(0xffFBFBFB);
  static const greyD7 = Color(0xffF5F5F5);
  static const greyD8 = Color(0xff262626);
  static const greyD9 = Color(0xFF3C3C3C);
  static const greyD10 = Color(0xFF707070);
  static const greyD11 = Color(0xFF989898);
  static const grey12 = Color(0xFFF7F8FA);
  static const grey13 = Color(0xFFF1F3F3);
  static const grey14 = Color(0xFFE4E7EC);
  static const grey15 = Color(0xFF092034);
  static const grey16 = Color(0xFFCED2DA);
  static const grey17 = Color(0xFF3B3B3B);
  static const grey18 = Color(0xFF637083);
  static const grey20 = Color(0xff687684);
  static const grey21 = Color(0xffF2F4F7);
  static const grey22 = Color(0xfff2f2f2);
  static const grey23 = Color(0xfffcfcfc);
  static const grey24 = Color(0xffa0a0a0);
  static const grey25 = Color(0xffE6EAEA);
  static const grey26 = Color(0xffeaeaea);
  static const grey27 = Color(0xffBCC5D3);
  static const grey28 = Color(0xff8f8f8f);
  static const grey1 = Color(0xffF7F7F7);
  static const grey30 = Color(0xff636363);
  static const grey31 = Color(0xffF6F6F6);

  static const BoxShadow boxShadow1 =
      BoxShadow(blurRadius: 50, spreadRadius: 50, color: AppColors.white);
  static const BoxShadow boxShadow2 =
      BoxShadow(blurRadius: 3, spreadRadius: 6, color: AppColors.white);
}
