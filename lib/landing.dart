import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/aboutMuseum.dart';
import 'package:nexusmuseum/exhibition.dart';
import 'package:nexusmuseum/exhibitions.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/globals.dart';

import 'tickets.dart';

// Экран Landing
class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  late final SlidableController slidableController = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(
          extentRatio: 0.6,
          motion: const BehindMotion(),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Material(
                color: yellow,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              slidableController.close();
                            },
                            child: SvgPicture.asset('assets/icons/close.svg', width: 16),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AboutMuseum(),
                            ),
                          );
                        },
                        child: Text(
                          'О музее',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Exhibitions(),
                            ),
                          );
                        },
                        child: Text(
                          'Выставки',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => TicketsPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Билеты',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Карта',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: white,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          left: true,
          right: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(21),
                  height: MediaQuery.of(context).size.height * 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/landing.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              slidableController.openStartActionPane();
                            },
                            child: SvgPicture.asset('assets/icons/driver.svg', width: 25),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset('assets/icons/profile.svg', width: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 46),
                      Text(
                        'NEXUSMUSEUM',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 38,
                          color: background,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => TicketsPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 45),
                          backgroundColor: error,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Купить билеты',
                          style: GoogleFonts.inter(fontSize: 16, color: white),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/vk.svg',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/classmates.svg',
                              width: 20,
                              height: 25,
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/telegram.svg',
                              width: 20,
                              height: 22,
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/rutube.svg',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 36,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'События и программы',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
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
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    foregroundColor: white,
                  ),
                  child: Text(
                    'Посмотреть',
                    style: GoogleFonts.inter(fontSize: 13, color: white),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Text(
                              'Бесплатный вход в рамках UNIQLO Nights',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: background,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Получить билеты  →',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: background,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        width: 130,
                        child: Text(
                          'Музей Nexus работает допоздна каждую пятницу и открыт бесплатно. Присоединяйтесь к нам вечером!',
                          style: GoogleFonts.inter(
                            fontSize: 9,
                            color: background,
                          ),
                        ),
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
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Показы фильмов, выступления, мастер-классах, лекции и не только.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Посмотреть календарь  →',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.bold,
                          ),
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: exhibitionList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ExhibitionPage(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(exhibitionList[index]),
                                fit: BoxFit.cover,
                              ),
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
                                    style: GoogleFonts.inter(
                                      fontSize: 7,
                                      color: white,
                                    ),
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
                        child: Text(
                          'Музей Nexus работает допоздна каждую пятницу и открыт бесплатно. Присоединяйтесь к нам вечером!',
                          style: GoogleFonts.inter(
                            fontSize: 9,
                            color: background,
                          ),
                        ),
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
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: background,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Получить билеты  →',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: background,
                                fontWeight: FontWeight.bold,
                              ),
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
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Фильмы, выступления, мастер-классы, лекции и многое другое.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Посмотреть календарь  →',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.bold,
                          ),
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: collectionList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(collectionList[index]),
                              fit: BoxFit.cover,
                            ),
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
                                    style: GoogleFonts.inter(
                                      fontSize: 7,
                                      color: white,
                                    ),
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
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
