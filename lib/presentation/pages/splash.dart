import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/domain/globals.dart';
import 'package:nexusmuseum/presentation/uikit/colors.dart';

// Экран Сплэш
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      navToLanding(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Text('NEXUSMUSEUM', style: GoogleFonts.playfairDisplay(fontSize: 32, color: black)),
      ),
    );
  }
}
