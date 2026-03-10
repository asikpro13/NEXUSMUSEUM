import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/aboutMuseum.dart';
import 'package:nexusmuseum/exhibition.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'tickets.dart';

// Экран Exhibitions
class Exhibitions extends StatefulWidget {
  const Exhibitions({super.key});

  @override
  State<Exhibitions> createState() => _ExhibitionsState();
}

class _ExhibitionsState extends State<Exhibitions>
    with SingleTickerProviderStateMixin {
  late final SlidableController slidableController = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(extentRatio: 0.6, motion: const BehindMotion(), children: [DrawerProject()]),
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
                    image: DecorationImage(image: AssetImage('assets/images/exhibitions.png'), fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      AppBarProject(isTitle: true),
                      Spacer(),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 125,
                                height: 25,
                                decoration: BoxDecoration(color: background, borderRadius: BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text('СЕНТЯБРЬ 16', style: GoogleFonts.inter(fontSize: 15, color: black)),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'СОСУД ВЕЧНОСТИ:\nИСКУССТВО ВАЗЫ ЧЕРЕЗ ВЕКА',
                                style: GoogleFonts.inter(fontSize: 15, color: background, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text('От античных амфор до современных\nарт-объектов', style: GoogleFonts.inter(fontSize: 13, color: background)),
                              SizedBox(height: 35),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/vk.svg', width: 20, height: 20)),
                          SizedBox(width: 20),
                          GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/classmates.svg', width: 20, height: 25)),
                          SizedBox(width: 20),
                          GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/telegram.svg', width: 20, height: 22)),
                          SizedBox(width: 20),
                          GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/rutube.svg', width: 30, height: 30)),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 27),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Выставки',
                        style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Аудитория',
                            style: GoogleFonts.inter(fontSize: 14, color: black, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 13),
                          Text(
                            'Место проведения',
                            style: GoogleFonts.inter(fontSize: 14, color: black, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 13),
                          Text(
                            'Дата',
                            style: GoogleFonts.inter(fontSize: 14, color: black, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                            '→',
                            style: GoogleFonts.inter(fontSize: 15, color: black, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 13),
                          Text(
                            '→',
                            style: GoogleFonts.inter(fontSize: 15, color: black, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 13),
                          Text(
                            '→',
                            style: GoogleFonts.inter(fontSize: 15, color: black, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Сбросить фильтр',
                        style: GoogleFonts.inter(fontSize: 15, color: error, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Выставки в корпусах',
                        style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: exhibitionList.length - 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExhibitionPage()));
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
                                  child: SizedBox(
                                    width: 90,
                                    child: Text(
                                      titleExhibitionList[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(fontSize: 9, color: white),
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
                SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Будущие выставки',
                        style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: futureExhibitionList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExhibitionPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(futureExhibitionList[index]), fit: BoxFit.cover),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 8,
                                  bottom: 12,
                                  left: 8,
                                  child: SizedBox(
                                    width: 120,
                                    child: Text(
                                      titleFutureExhibitionList[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(fontSize: 7, color: white),
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
                SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Будущие коллекции',
                        style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: futureExhibition2List.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(futureExhibition2List[index]), fit: BoxFit.cover),
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
                                    titleFutureExhibition2List[index],
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
                FooterProject(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
