import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/aboutMuseum.dart';
import 'package:nexusmuseum/exhibition.dart';
import 'package:nexusmuseum/exhibitions.dart';
import 'package:nexusmuseum/landing.dart';
import 'package:nexusmuseum/tickets.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/virtualSession.dart';
import 'package:nexusmuseum/visualMap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// Контроллер для драйвера
dynamic slidableController;

// Списки
List<String> programsList = ['assets/images/program_1.png', 'assets/images/program_2.png', 'assets/images/program_3.png'];

List<String> programsViewList = ['assets/images/program_view1.png', 'assets/images/program_view2.png', 'assets/images/program_view3.png'];

List<String> titleProgramsViewList = ['Цикл лекций:\nМода СССР 60-х годов', 'Искусство изготовления\nмечей и кинжалов', 'Поединки и дуэли \nот Ахилла до Лифаря'];

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

List<String> audiences = ['4-6 лет', '7-9 лет', '10-13 лет', '14-17 лет', 'Взрослые', 'Семьи', 'Студенты', 'Профессионалы'];

List<String> venues = ['Корпус «Античность»', 'Корпус «Средневековье»', 'Корпус «Просвещение»', 'Корпус «Современность»'];

List<String> availableTimes = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:30', '20:00', '21:00'];

// Выбранный элемент
String? selectedAudience;
String? selectedVenue;
DateTime? selectedDate;
String? selectedTime;

// Переменные для звонка по номеру телефона
final String phoneNumber = '+7 (999) 123-45-67';
final String phoneUrl = 'tel:+79991234567';

// Очистка выбранных элементов
void clearSelected() {
  selectedAudience = null;
  selectedVenue = null;
  selectedTime = null;
  selectedDate = null;
}

// Навигация на экран "О Музее"
void navToAboutMuseum(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AboutMuseum()));
  clearSelected();
  closeDrawer();
}

// Навигация на экран "Выставки"
void navToExhibitions(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Exhibitions()));
  clearSelected();
  closeDrawer();
}

// Навигация на экран "Билеты"
void navToTickets(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Tickets()));
  clearSelected();
  closeDrawer();
}

// Навигация на экран "Выставка"
void navToExhibition(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Exhibition()));
  clearSelected();
  closeDrawer();
}

// Навигация на экран "Лендинг"
void navToLanding(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Landing()));
  clearSelected();
  closeDrawer();
}

// Навигация на экран "Виртуальная карта"
void navToVirtualMap(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VirtualMap()));
  clearSelected();
  closeDrawer();
}

// Навигация на экран "Виртуальный визит"
void navToVirtualSession(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VirtualSession()));
  clearSelected();
  closeDrawer();
}

// Функция закрытия драйвера
void closeDrawer() {
  slidableController!.close();
}

// Функция открытия драйвера
void openDrawer() {
  slidableController!.openStartActionPane();
}

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
            leading: SvgPicture.asset('assets/icons/geo.svg', width: 20),
            title: Text('Лаврушинский переулок, 10', style: GoogleFonts.inter(fontSize: 16)),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/clock.svg', width: 20),
            title: Text('Вт-Вс: 10:00-18:00', style: GoogleFonts.inter(fontSize: 16)),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/phone.svg', width: 20),
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
                  elevation: 0,
                ),
                child: Text('Закрыть', style: GoogleFonts.inter(fontSize: 16, color: white)),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    ),
  );
}

// Функция показа фотографий
void openPhotoViewGallery({required BuildContext context, required List<String> imageList, required List<String> titleList, required int initialIndex}) {
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
              loadingBuilder: (context, event) => const Center(child: CircularProgressIndicator()),
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
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
                  child: SvgPicture.asset('assets/icons/close.svg', color: Colors.white),
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
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleList[currentIndex],
                          style: GoogleFonts.inter(color: white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text('${currentIndex + 1} / ${imageList.length}', style: GoogleFonts.inter(color: Colors.white70, fontSize: 14)),
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

// Функция для показа модального окна
void showDialogSuccess(BuildContext context, String title, String comment) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(color: black, fontSize: 18, fontWeight: FontWeight.bold, height: 1.2),
            ),
            const SizedBox(height: 10),
            Text(
              comment,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(color: const Color(0xff8A8C90), fontSize: 14, height: 1.5),
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
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text(
                      'Закрыть',
                      style: GoogleFonts.inter(color: white, fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      );
    },
  );
}

// Тип функции для обработки выбора элемента из списка
typedef void OnItemSelected<T>(T selectedItem);

// Функция для показа списка
void showSelector<T>({required BuildContext context, required String title, required List<T> items, required T? selectedItem, required OnItemSelected<T> onSelected, String Function(T)? itemToString}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: light_gray, borderRadius: BorderRadius.circular(2)),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                title,
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: black),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final displayText = itemToString != null ? itemToString(item) : item.toString();
                  final isSelected = item == selectedItem;
                  return GestureDetector(
                    onTap: () {
                      onSelected(item);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(color: isSelected ? gold.withOpacity(0.1) : Colors.transparent),
                      child: Row(
                        children: [
                          Text(
                            displayText,
                            style: GoogleFonts.inter(fontSize: 16, color: isSelected ? gold : black, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
