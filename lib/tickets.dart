import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/uikit/colors.dart';

// Экран Билеты
class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  final ScrollController _scrollController = ScrollController();
  int quantity = 1; // Количество билетов
  int count = 900; // Цена билета
  int selectedCategory = 0; // Индекс категории

  // Очищение контроллера
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Анимация скролла
  void _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.extentInside, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(extentRatio: 0.6, motion: BehindMotion(), children: [DrawerProject()]),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/tickets.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarProject(isTitle: true),
                    Spacer(),
                    GestureDetector(
                      onTap: _scrollToBottom,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Билеты',
                            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: white),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '↓',
                            style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.bold, color: white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 27),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Категории',
                          style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 45,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categoriesList.length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedCategory == index;
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory = index;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    splashFactory: NoSplash.splashFactory,
                                    minimumSize: Size(categoriesButtonWidthList[index], 45),
                                    backgroundColor: isSelected ? light_gray : background,
                                    shape: RoundedRectangleBorder(side: isSelected ? BorderSide.none : BorderSide(color: light_gray)),
                                    elevation: 0,
                                  ),
                                  child: Text(categoriesList[index], style: GoogleFonts.inter(fontSize: 16, color: isSelected ? white : light_gray)),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Аудитория',
                              style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '→',
                                style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Дата',
                              style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '→',
                                style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          '5 октября 2025 г., 19:30',
                          style: GoogleFonts.inter(fontSize: 14, color: light_gray, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Место проведения',
                              style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '→',
                                style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Третьяковская галерея, Новая\nТретьяковка, Крымский Вал, 10',
                          style: GoogleFonts.inter(fontSize: 14, color: light_gray, fontWeight: FontWeight.bold, height: 1.3),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Количество',
                              style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'Стоимость',
                              style: GoogleFonts.inter(fontSize: 16, color: black, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  }),
                                  child: SvgPicture.asset('assets/icons/minus.svg'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(' $quantity' + ' шт', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                                ),
                                GestureDetector(
                                  onTap: () => setState(() => quantity++),
                                  child: Padding(padding: EdgeInsets.all(8), child: SvgPicture.asset('assets/icons/plus.svg')),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '${count * quantity} ₽',
                              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(90, 40),
                                padding: EdgeInsets.all(10),
                                splashFactory: NoSplash.splashFactory,
                                backgroundColor: background,
                                side: BorderSide(color: gold, width: 1),
                                shape: RoundedRectangleBorder(),
                                elevation: 0,
                              ),
                              child: Text('Продолжить покупки', style: GoogleFonts.inter(fontSize: 14.5, color: Colors.black)),
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                showDialogSuccess(context, 'Успешно', 'Вы успешно оформили заказ');
                              },
                              style: ElevatedButton.styleFrom(splashFactory: NoSplash.splashFactory, minimumSize: Size(120, 40), backgroundColor: black, shape: RoundedRectangleBorder(), elevation: 0),
                              child: Text('Оформить', style: GoogleFonts.inter(fontSize: 14.5, color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  FooterProject(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
