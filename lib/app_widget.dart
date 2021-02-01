import 'package:data_app/core/colors.dart';
import 'package:data_app/presentation/pages/index_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: kSwatch2, systemNavigationBarColor: kSwatch2));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.light().copyWith(textTheme: GoogleFonts.latoTextTheme()),
        home: IndexPage());
  }
}
