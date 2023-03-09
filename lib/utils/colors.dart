import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

const backgroundColor = Color(0xFFf5f5f5);
const buttonColor = Color.fromRGBO(24, 23, 23, 1);
const textColor = Color.fromRGBO(0, 0, 0, 1);
const whiteBackground = Color.fromRGBO(255, 255, 255, 1);
const lightColor = Color(0xFFc8c8c8);
const faintBlackColor = Color.fromRGBO(200, 200, 200, 1);
var deleteFaintBlackColor = Color.fromRGBO(200, 200, 200, 1);
var deleteBlackColor = Color.fromRGBO(0, 0, 0, 1);
var bookmarkFaintColor = Color.fromRGBO(200, 200, 200, 1);
var bookmarkBlackColor = Color.fromRGBO(0, 0, 0, 1);

final textFont = GoogleFonts.roboto(
  textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      color: Colors.black),
);
final bigtextFont = GoogleFonts.roboto(
  textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      color: Colors.black),
);
final smallFont = GoogleFonts.roboto(
    textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: faintBlackColor));

final buttonFont = GoogleFonts.roboto(
  textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: Colors.white),
);
final headerFont = GoogleFonts.roboto(
  textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: textColor),
);

final navText = GoogleFonts.roboto(
  textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: Colors.black),
);
final shortlistFont = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Color.fromRGBO(215, 60, 16, 1),
  ),
);
final profileFont = GoogleFonts.roboto(
  textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: Colors.black),
);
