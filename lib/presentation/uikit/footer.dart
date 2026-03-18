import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/domain/globals.dart';
import 'package:nexusmuseum/presentation/pages/aboutMuseum.dart';
import 'package:nexusmuseum/presentation/pages/landing.dart';
import 'package:nexusmuseum/presentation/uikit/colors.dart';

// Футер
class FooterProject extends StatefulWidget {
  const FooterProject({super.key});

  @override
  State<FooterProject> createState() => _FooterProjectAppState();
}

class _FooterProjectAppState extends State<FooterProject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 15, bottom: 30, left: 20, right: 20),
      color: gray,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AboutMuseum()));
                },
                child: Text('О МУЗЕЕ', style: GoogleFonts.inter(fontSize: 12, color: background)),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: Text('ДЛЯ СМИ', style: GoogleFonts.inter(fontSize: 12, color: background)),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: Text('КОНТАКТЫ', style: GoogleFonts.inter(fontSize: 12, color: background)),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Landing()));
                },
                child: Text(
                  'NEXUSMUSEUM',
                  style: GoogleFonts.playfairDisplay(fontSize: 18, color: background, fontWeight: FontWeight.w500),
                ),
              ),
              Spacer(),
              GestureDetector(onTap: () => openUrl('https://vk.com/tretyakovgallery'), child: SvgPicture.asset('assets/icons/vk.svg', width: 20, height: 20)),
              SizedBox(width: 20),
              GestureDetector(onTap: () => openUrl('https://ok.ru/group/68885515403324'), child: SvgPicture.asset('assets/icons/classmates.svg', width: 20, height: 25)),
              SizedBox(width: 20),
              GestureDetector(onTap: () => openUrl('https://t.me/s/GT_Gallery'), child: SvgPicture.asset('assets/icons/telegram.svg', width: 20, height: 22)),
              SizedBox(width: 20),
              GestureDetector(onTap: () => openUrl('https://rutube.ru/channel/25592111/'), child: SvgPicture.asset('assets/icons/rutube.svg', width: 30, height: 30)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 145,
                child: Text('ВС, ВТ, СР: 10:00 — 18:00 (кассы и вход до 17:00)\nПН: выходной\nЧТ, ПТ, СБ: 10:00 — 21:00 (кассы и вход до 20:00)', style: GoogleFonts.inter(fontSize: 11, color: background)),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Корпус «Античность»',
                    style: GoogleFonts.inter(fontSize: 11, color: background, fontWeight: FontWeight.w600),
                  ),
                  Text('метро Новокузнецкая', style: GoogleFonts.inter(fontSize: 11, color: background)),
                  SizedBox(height: 10),
                  SvgPicture.asset('assets/icons/made-in-russia.svg', width: 120, height: 40),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
