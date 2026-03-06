import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMuseumPage extends StatefulWidget {
  const AboutMuseumPage({super.key});

  @override
  State<AboutMuseumPage> createState() => _AboutMuseumPageState();
}

class _AboutMuseumPageState extends State<AboutMuseumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/image1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, color: Colors.white, size: 40,),
                        Text(
                          'NEXUS MUSEUM',
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.account_circle, color: Colors.white, size: 40),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'О МУЗЕЕ',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'NEXUSMUSEUM — Мост между временами и культуры',
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('images/VK.png'),
                          Image.asset('images/OK.png'),
                          Image.asset('images/TG.png'),
                          Image.asset('images/YTB.png'),
                        ],
                      ),
                      SizedBox(height: 50,),
                      Text('Адрес и часы работы', style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.bold),),
                      Row()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
    ;
  }
}
