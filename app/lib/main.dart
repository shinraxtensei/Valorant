import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:valorant/srcs/screens/home.dart';
import 'package:valorant/utils/constant.dart';

final logger = Logger();

Future<void> main() async {
  await dotenv.load();
  logger.d('API_BASE_URL: ${dotenv.env['API_BASE_URL']}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Valorant',
        // theme: ThemeData(
        //     useMaterial3: true,
        //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
        //         .copyWith(background: Colors.blueGrey),
        //     primaryColor: HexColor('#101823')),,
        theme: ThemeData(colorScheme: colorScheme),
        home: const Scaffold(body: Home()));
  }
}
