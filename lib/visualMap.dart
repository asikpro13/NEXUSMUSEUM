import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';

// Экран Визуальная карта
class VirtualMap extends StatefulWidget {
  const VirtualMap({super.key});

  @override
  State<VirtualMap> createState() => _VirtualMapState();
}

class _VirtualMapState extends State<VirtualMap> {
  final ScrollController _scrollControllerMap = ScrollController(); // Контроллер для скролла

  // Анимация скролла
  void _scrollToBottom() {
    _scrollControllerMap.animateTo(_scrollControllerMap.position.extentInside, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  // Очищение контроллера
  void dispose() {
    _scrollControllerMap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(extentRatio: 0.6, motion: const BehindMotion(), children: [DrawerProject()]),
        child: SingleChildScrollView(
          controller: _scrollControllerMap,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/virtualMap.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    AppBarProject(isTitle: true),
                    Spacer(),
                    GestureDetector(
                      onTap: _scrollToBottom,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Виртуальный визит',
                            style: GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.bold, color: white),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '↓',
                            style: GoogleFonts.inter(fontSize: 23, fontWeight: FontWeight.bold, color: white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // SocialNetworks(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Музейные комплексы',
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
                        onLongPress: () {
                          openPhotoViewGallery(context: context, imageList: exhibitionList.sublist(0, exhibitionList.length - 2), titleList: titleExhibitionList.sublist(0, titleExhibitionList.length - 2), initialIndex: index);
                        },
                        onTap: () {
                        navToVirtualSession(context);
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(exhibitionList[index]), fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset('assets/images/blur.png', fit: BoxFit.cover, width: double.infinity),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          titleExhibitionList[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(fontSize: 8.4, color: white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                      'Выставочные центры',
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
                      child: GestureDetector(
                        onLongPress: () {
                          openPhotoViewGallery(context: context, imageList: futureExhibition2List, titleList: titleFutureExhibition2List, initialIndex: index);
                        },
                        onTap: () {
                          navToVirtualSession(context);
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(futureExhibition2List[index]), fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset('assets/images/blur.png', fit: BoxFit.cover, width: double.infinity),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          titleFutureExhibition2List[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(fontSize: 8.4, color: white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                      'Реконструкции',
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
                        onLongPress: () {
                          openPhotoViewGallery(context: context, imageList: futureExhibitionList, titleList: titleFutureExhibitionList, initialIndex: index);
                        },
                        onTap: () {
                          navToVirtualSession(context);
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(futureExhibitionList[index]), fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset('assets/images/blur.png', fit: BoxFit.cover, width: double.infinity),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          titleFutureExhibitionList[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(fontSize: 8.4, color: white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
    );
  }
}
