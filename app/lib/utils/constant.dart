import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hexcolor/hexcolor.dart';

var baseUrl = dotenv.env["API_BASE_URL"];

var colorScheme =  ColorScheme(
    background: HexColor('#18273c'),
    onBackground: const Color(0xFFFFFFFF),
    brightness: Brightness.dark,
    primary: const Color(0xFFff4458),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFF19283d),
    onSecondary: const Color(0xFFFFFFFF),
    error: const Color(0xffcf6679),
    onError: const Color(0xFFFFFFFF),
    surface: const Color(0xFF18273c),
    onSurface: const Color(0xFFFFFFFF));


