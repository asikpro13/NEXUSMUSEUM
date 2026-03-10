import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/aboutMuseum.dart';
import 'package:nexusmuseum/exhibitions.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/tickets.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/const.dart';

// Драйвер
class DrawerProject extends StatefulWidget {
  const DrawerProject({super.key});

  @override
  State<DrawerProject> createState() => _DrawerProjectState();
}

class _DrawerProjectState extends State<DrawerProject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: yellow,
      child: SafeArea(
        top: true,
        bottom: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        slidableController.close();
                      },
                      child: SvgPicture.asset('assets/icons/close.svg', width: 20),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AboutMuseum()));
                  },
                  child: Text(
                    'О музее',
                    style: GoogleFonts.playfairDisplay(fontSize: drawerSizeText, fontWeight: FontWeight.w500, color: white),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Exhibitions()));
                  },
                  child: Text(
                    'Выставки',
                    style: GoogleFonts.playfairDisplay(fontSize: drawerSizeText, color: white, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TicketsPage()));
                  },
                  child: Text(
                    'Билеты',
                    style: GoogleFonts.playfairDisplay(fontSize: drawerSizeText, fontWeight: FontWeight.w500, color: white),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Карта',
                    style: GoogleFonts.playfairDisplay(fontSize: drawerSizeText, fontWeight: FontWeight.w500, color: white),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
