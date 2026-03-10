import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/exhibition.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/tickets.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/social.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(extentRatio: 0.6, motion: const BehindMotion(), children: [DrawerProject()]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/landing.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    AppBarProject(isTitle: false),
                    Text('NEXUSMUSEUM', style: GoogleFonts.playfairDisplay(fontSize: 40, color: background)),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TicketsPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 45),
                        backgroundColor: error,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        elevation: 5,
                      ),
                      child: Text('Купить билеты', style: GoogleFonts.inter(fontSize: 16, color: white)),
                    ),
                    SizedBox(height: 20),
                    SocialNetworks(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
                child: Row(
                  children: [
                    Text(
                      'События и программы',
                      style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: programsList.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 140,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(135, 40),
                  backgroundColor: grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  foregroundColor: white,
                ),
                child: Text('Посмотреть', style: GoogleFonts.inter(fontSize: 13, color: white)),
              ),
              Container(
                width: double.infinity,
                color: gold,
                margin: EdgeInsets.symmetric(vertical: 18),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170,
                          child: Text(
                            'Бесплатный вход в рамках UNIQLO Nights',
                            style: GoogleFonts.inter(fontSize: 11, color: background, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Получить билеты  →',
                            style: GoogleFonts.inter(fontSize: 13, color: background, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: 130,
                      child: Text('Музей Nexus работает допоздна каждую пятницу и открыт бесплатно. Присоединяйтесь к нам вечером!', style: GoogleFonts.inter(fontSize: 9, color: background)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Выставки',
                      style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Показы фильмов, выступления, мастер-классах, лекции и не только.',
                      style: GoogleFonts.inter(fontSize: 13, color: black, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Посмотреть календарь  →',
                        style: GoogleFonts.inter(fontSize: 14, color: black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: exhibitionList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ExhibitionPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(exhibitionList[index]), fit: BoxFit.cover),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 8,
                                bottom: 12,
                                left: 8,
                                child: Text(
                                  titleExhibitionList[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(fontSize: 7, color: white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                color: gold,
                margin: EdgeInsets.symmetric(vertical: 18),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text('Музей Nexus работает допоздна каждую пятницу и открыт бесплатно. Присоединяйтесь к нам вечером!', style: GoogleFonts.inter(fontSize: 9, color: background)),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170,
                          child: Text(
                            'Бесплатный вход в рамках UNIQLO Nights',
                            style: GoogleFonts.inter(fontSize: 11, color: background, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Получить билеты  →',
                            style: GoogleFonts.inter(fontSize: 13, color: background, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Коллекции',
                      style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Фильмы, выступления, мастер-классы, лекции и многое другое.',
                      style: GoogleFonts.inter(fontSize: 13, color: black, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Посмотреть календарь  →',
                        style: GoogleFonts.inter(fontSize: 14, color: black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: collectionList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(collectionList[index]), fit: BoxFit.cover),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 8,
                              bottom: 12,
                              left: 8,
                              child: SizedBox(
                                width: 100,
                                child: Text(
                                  titleCollectionList[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(fontSize: 7, color: white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              // FooterApp(),
            ],
          ),
        ),
      ),
    );
  }
}
