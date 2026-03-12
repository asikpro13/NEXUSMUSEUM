import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

// Контроллер для драйвера
dynamic slidableController;

// Списки
List<String> programsList = ['assets/images/program_1.png', 'assets/images/program_2.png', 'assets/images/program_3.png'];

List<String> exhibitionList = [
  'assets/images/exhibition_1.png',
  'assets/images/exhibition_2.png',
  'assets/images/exhibition_3.png',
  'assets/images/exhibition_4.png',
  'assets/images/exhibition_5.png',
  'assets/images/exhibition_6.png',
  'assets/images/exhibition_7.png',
  'assets/images/exhibition_8.png',
  'assets/images/exhibition_9.png',
];

List<String> exhibitionsList = ['assets/images/exhibition_16.png', 'assets/images/exhibition_17.png', 'assets/images/exhibition_18.png', 'assets/images/exhibition_19.png'];

List<String> titleExhibitionsList = ['Останки динозавра', 'Трицератопс', 'Тираннозавр Рекс', 'Птеродактель'];

List<String> titleExhibitionList = [
  'Метафизика тишины —\nСвет пустота созерцание',
  'Тени забытых предков —\nИстория генеалогия память',
  'Хрупкое равновесие —\nЭкология климат человек',
  'Бессознательная геометрия —\nСны абстракция символы',
  'Тактильность воспоминаний —\nТекстура форма память',
  'Рожденные электричеством —\nТехнологии цифра будущее',
  'Искусство против времени —\nПротест сопротивление голос',
  'Цвет звука — Синтез\nсинестезия гармония',
  'Городские симфонии —\nАрхитектура ритм движение',
];

List<String> futureExhibitionList = ['assets/images/exhibition_5.png', 'assets/images/exhibition_9.png', 'assets/images/exhibition_4.png', 'assets/images/exhibition_8.png', 'assets/images/exhibition_7.png'];

List<String> titleFutureExhibitionList = [
  'Тактильность воспоминаний —\nТекстура форма память',
  'Рожденные электричеством —\nТехнологии цифра будущее',
  'Бессознательная геометрия —\nСны абстракция символы',
  'Цвет звука — Синтез\nсинестезия гармония',
  'Искусство против времени —\nПротест сопротивление голос',
];

List<String> futureExhibition2List = [
  'assets/images/exhibition_10.png',
  'assets/images/exhibition_11.png',
  'assets/images/exhibition_12.png',
  'assets/images/exhibition_13.png',
  'assets/images/exhibition_14.png',
  'assets/images/exhibition_15.png',
];

List<String> titleFutureExhibition2List = ['Симфония для ветра и\nпроводов', 'Интерьер с уходящим ухом', 'Танцующие с тишиной', 'Сон лунного геолога', 'Последний корабль к\nПолярной звезде', 'Шёпот забытых улиц'];

List<String> collectionList = ['assets/images/collection_1.png', 'assets/images/collection_2.png', 'assets/images/collection_3.png', 'assets/images/collection_4.png', 'assets/images/collection_5.png', 'assets/images/collection_6.png'];

List<String> titleCollectionList = ['Симфония для ветра и\nпроводов', 'Интерьер с уходящим ухом', 'Танцующие с тишиной', 'Сон лунного геолога', 'Последний корабль к\nПолярной звезде', 'Шёпот забытых улиц'];

List<String> categoriesList = ['Постоянные экспозиции', 'Выставки', 'Экскурсии', 'События'];

List<double> categoriesButtonWidthList = [200, 95, 110, 95];



// Переменные для звонка по номеру телефона
final String phoneNumber = '+7 (999) 123-45-67';
final String phoneUrl = 'tel:+79991234567';

// Функции для показа карты
void showMuseumInfo(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: background,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (contextMuseum) => Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(height: 20),
          Text('NEXUSMUSEUM', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListTile(
            leading: SvgPicture.asset('assets/icons/geo.svg', width: 20,),
            title: Text('Лаврушинский переулок, 10', style: GoogleFonts.inter(fontSize: 16)),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/clock.svg', width: 20),
            title: Text('Вт-Вс: 10:00-18:00', style: GoogleFonts.inter(fontSize: 16)),
          ),
          ListTile(
            leading:  SvgPicture.asset('assets/icons/phone.svg', width: 20),
            title: Text(phoneNumber, style: GoogleFonts.inter(fontSize: 16)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(contextMuseum),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 45),
                  backgroundColor: error,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 5,
                ),
                child: Text('Закрыть', style: GoogleFonts.inter(fontSize: 16, color: white)),
              ),
              Spacer()
            ],
          ),
        ],
      ),
    ),
  );
}

Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

// Функция показа фотографий
void openPhotoViewGallery({
  required BuildContext context,
  required List<String> imageList,
  required List<String> titleList,
  required int initialIndex,
}) {
  final PageController pageController = PageController(initialPage: initialIndex);
  ValueNotifier<int> currentIndexNotifier = ValueNotifier(initialIndex);

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: black,
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(imageList[index]),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 3,
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(tag: index),
                );
              },
              itemCount: imageList.length,
              loadingBuilder: (context, event) => const Center(
                child: CircularProgressIndicator(),
              ),
              backgroundDecoration: const BoxDecoration(color: Colors.black),
              pageController: pageController,
              onPageChanged: (index) {
                currentIndexNotifier.value = index;
              },
            ),
            Positioned(
              top: 40,
              left: 15,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/close.svg',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: ValueListenableBuilder<int>(
                valueListenable: currentIndexNotifier,
                builder: (context, currentIndex, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleList[currentIndex],
                          style: GoogleFonts.inter(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${currentIndex + 1} / ${imageList.length}',
                          style: GoogleFonts.inter(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//
void showDialogSuccess(BuildContext context, String title, String comment) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              comment,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: const Color(0xff8A8C90),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 35,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Закрыть',
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer()
              ],
            )
          ],
        ),
      );
    },
  );
}
