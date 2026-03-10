import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/social.dart';

// Экран Билеты
class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> with SingleTickerProviderStateMixin {
  late final SlidableController slidableController = SlidableController(this);
  int quantity = 1; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(extentRatio: 0.6, motion: BehindMotion(), children: [DrawerProject()]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/tickets.png'), fit: BoxFit.cover),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [AppBarProject(isTitle: true), Spacer(), SocialNetworks()]),
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
                        Text('Билеты', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text(
                          'Категории',
                          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 45),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.grey, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                            elevation: 5,
                          ),
                          child: Text('Постоянные экспозиции', style: GoogleFonts.inter(fontSize: 16, color: Colors.grey)),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 45),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.grey, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                            elevation: 5,
                          ),
                          child: Text('Выставки', style: GoogleFonts.inter(fontSize: 16, color: Colors.grey)),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 45),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.grey, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                            elevation: 5,
                          ),
                          child: Text('События', style: GoogleFonts.inter(fontSize: 16, color: Colors.grey)),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(110, 45),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.grey, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                            elevation: 5,
                          ),
                          child: Text('Экскурсии', style: GoogleFonts.inter(fontSize: 16, color: Colors.grey)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '5 октября 2025 г., 19:30',
                              style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            Spacer(),
                            Text(
                              'Третьяковская галерея, Новая\nТретьяковка, Крымский Вал, 10  ',
                              style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('Корзина', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Количество',
                              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            Spacer(),
                            Text(
                              'Стоимость',
                              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => setState(() => quantity > 0 ? quantity-- : null),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('-', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Text('$quantity', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() => quantity++),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('+', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${900 * quantity} ₽',
                              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              'Итого:',
                              style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: error),
                            ),
                            Spacer(),
                            Text(
                              '${900 * quantity} ₽',
                              style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: error),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(color: gold, width: 1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                                    elevation: 5,
                                  ),
                                  child: Text('Продолжить покупки', style: GoogleFonts.inter(fontSize: 16, color: Colors.black)),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(150, 45),
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
                                    elevation: 5,
                                  ),
                                  child: Text('Оформить покупки', style: GoogleFonts.inter(fontSize: 16, color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Footer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
