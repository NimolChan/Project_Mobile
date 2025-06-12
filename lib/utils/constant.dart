import 'package:flutter/material.dart';

class AppRoutes {
  static const auth = '/auth';
  static const home = '/home';
  static const collection = '/collection';
  static const visualize = '/visualize';
  static const personal = '/personal';
  static const settings = '/settings';
}
class AppColors {
  // solid colors
  static const Color purple = Color(0xFFC064F1);
  static const Color grey = Color(0xFF94A3B8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blue = Color(0xFF0028DA);

  static const Color background = Color(0xFFFFFFFF);
}
class ClothesConstants {

  static const clothesSizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  static const clothesColors = ['Red', 'Blue', 'Black', 'White', 'Green', 'Yellow', 'Pink', 'Gray'];
  static const clothesTypes = ['Jacket', 'T-Shirt', 'Jeans', 'Dress', 'Skirt', 'Sweater', 'Shorts', 'Coat'];
  static const clothesLocations = ['New York', 'Los Angeles', 'Chicago', 'Miami', 'Dallas', 'Seattle'];
  static const clothesTags = ['Summer', 'Winter', 'Casual', 'Formal', 'Sport', 'Vintage', 'Trendy'];
}

class AppFonts {
  // Font Families
  static const String meriendaOne = 'Merienda One';
  static const String poppins = 'Poppins';
  static const String aBeeZee = 'ABeeZee';

  // Font Weights (common for all fonts)
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Merienda One Text Styles
  static TextStyle meriendaDisplayLarge = const TextStyle(
    fontFamily: meriendaOne,
    fontSize: 24,
    fontWeight: regular,
    letterSpacing: 0,
  );

  // Poppins Text Styles
  static TextStyle poppinsBodyMedium = const TextStyle(
    fontFamily: poppins,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0.25,
  );

  // ABeeZee Text Styles
  static TextStyle aBeeZeeLabelLarge = const TextStyle(
    fontFamily: aBeeZee,
    fontSize: 20,
    fontWeight: medium,
    letterSpacing: 0.1,
  );

  static TextStyle aBeeZeeBodySmall = const TextStyle(
    fontFamily: aBeeZee,
    fontSize: 14,
    fontWeight: regular,
    letterSpacing: 0.4,
  );

  // Add more styles as needed...
}

