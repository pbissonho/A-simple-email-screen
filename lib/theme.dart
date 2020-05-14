import 'package:flutter/material.dart';

const textCardColor = Color.fromRGBO(77, 97, 133, 1);
const textCardSecondaryColor = Color.fromRGBO(82, 102, 137, 1);
const iconBottomColor = Color.fromRGBO(114, 144, 198, 1);
const emailIconBackgroundColor = Color.fromRGBO(8, 58, 120, 1);

const primaryValue = 0xFF051839;

const MaterialColor primarySwatchColor = const MaterialColor(
  primaryValue,
  const <int, Color>{
    50: const Color(0xFFe0e0e0),
    100: const Color(0xFFb3b3b3),
    200: const Color(0xFF808080),
    300: const Color(0xFF4d4d4d),
    400: const Color(0xFF262626),
    500: const Color(primaryValue),
    600: const Color(0xFF000000),
    700: const Color(0xFF000000),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

var theme = ThemeData(
  bottomAppBarColor: Color.fromRGBO(11, 38, 91, 1),
  primarySwatch: primarySwatchColor,
  iconTheme: IconThemeData(color: Color(0xFF045b90))
);
