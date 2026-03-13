import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/date.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/uikit/social.dart';

// Экран Exhibitions
class Exhibitions extends StatefulWidget {
  const Exhibitions({super.key});

  @override
  State<Exhibitions> createState() => _ExhibitionsState();
}

class _ExhibitionsState extends State<Exhibitions> {
  // Выбор аудитории
  void _showAudienceSelector() {
    showSelector<String>(
      context: context,
      title: 'Выберите аудиторию',
      items: audiences,
      selectedItem: selectedAudience,
      onSelected: (item) {
        setState(() {
          selectedAudience = item;
        });
      },
    );
  }

  // Выбор места проведения
  void _showVenueSelector() {
    showSelector<String>(
      context: context,
      title: 'Выберите место проведения',
      items: venues,
      selectedItem: selectedVenue,
      onSelected: (item) {
        setState(() {
          selectedVenue = item;
        });
      },
    );
  }

  // Выбор даты
  void _showDatePicker() async {
    final DateTime? pickedDate = await DateSelectorHelper.showSimpleDatePicker(context: context, initialDate: selectedDate, accentColor: gold);

    if (pickedDate != null) {
      _showTimeSelector(pickedDate);
    }
  }

  // Выбор времени
  void _showTimeSelector(DateTime date) {
    showSelector<String>(
      context: context,
      title: 'Выберите время',
      items: availableTimes,
      selectedItem: selectedTime,
      onSelected: (time) {
        setState(() {
          selectedDate = date;
          selectedTime = time;
        });
      },
    );
  }

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
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/exhibitions.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
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
                    SocialNetworks(),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Аудитория',
                          style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: _showAudienceSelector,
                          child: Text(
                            '→',
                            style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    if (selectedAudience != null && selectedAudience!.isNotEmpty)
                      Text(
                        selectedAudience!,
                        style: GoogleFonts.inter(fontSize: 14, color: light_gray, fontWeight: FontWeight.bold, height: 1.3),
                      ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Дата',
                          style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: _showDatePicker,
                          child: Text(
                            '→',
                            style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    if (selectedDate != null && selectedTime!.isNotEmpty)
                      Text(
                        formatSelectedDateTime(),
                        style: GoogleFonts.inter(fontSize: 14, color: light_gray, fontWeight: FontWeight.bold),
                      ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Локация',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: _showVenueSelector,
                          child: Text(
                            '→',
                            style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    if (selectedVenue != null && selectedVenue!.isNotEmpty)
                      Text(
                        selectedVenue!,
                        style: GoogleFonts.inter(fontSize: 14, color: light_gray, fontWeight: FontWeight.bold, height: 1.3),
                      ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          clearSelected();
                        });
                      },
                      child: Text(
                        'Сбросить фильтр',
                        style: GoogleFonts.inter(fontSize: 15, color: error, fontWeight: FontWeight.bold),
                      ),
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
                        onLongPress: () {
                          openPhotoViewGallery(context: context, imageList: exhibitionList.sublist(0, exhibitionList.length - 2), titleList: titleExhibitionList.sublist(0, titleExhibitionList.length - 2), initialIndex: index);
                        },
                        onTap: () {
                          navToExhibition(context);
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
                        onLongPress: () {
                          openPhotoViewGallery(context: context, imageList: futureExhibitionList, titleList: titleFutureExhibitionList, initialIndex: index);
                        },
                        onTap: () {
                          navToExhibition(context);
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
                      child: GestureDetector(
                        onLongPress: () {
                          openPhotoViewGallery(context: context, imageList: futureExhibition2List, titleList: titleFutureExhibition2List, initialIndex: index);
                        },
                        onTap: () {},
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
              SizedBox(height: 50),
              FooterProject(),
            ],
          ),
        ),
      ),
    );
  }
}
