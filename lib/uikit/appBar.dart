import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/landing.dart';
import 'package:nexusmuseum/uikit/colors.dart';

// Главная панель
class AppBarProject extends StatefulWidget {
  final bool isTitle;

  const AppBarProject({super.key, required this.isTitle});

  @override
  State<AppBarProject> createState() => _AppBarProjectState();
}

class _AppBarProjectState extends State<AppBarProject> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              slidableController!.openStartActionPane();
            },
            child: SvgPicture.asset('assets/icons/driver.svg', width: 28),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Landing()));
            },
            child: Text('NEXUSMUSEUM', style: GoogleFonts.playfairDisplay(fontSize: 26, color: widget.isTitle ? background : Colors.transparent)),
          ),
          Spacer(),
          GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/profile.svg', width: 22)),
        ],
      ),
    );
  }
}
