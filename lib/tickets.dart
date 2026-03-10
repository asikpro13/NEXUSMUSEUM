import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/exhibitions.dart';
import 'package:nexusmuseum/landing.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'aboutMuseum.dart';

// Экран Билеты
class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage>

    with SingleTickerProviderStateMixin {
  late final SlidableController slidableController = SlidableController(this);
  int quantity = 1; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(
          extentRatio: 0.6,
          motion: BehindMotion(),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Material(
                color: yellow,
                child: Padding(
                  padding: EdgeInsets.all(24),
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
                            child: SvgPicture.asset('assets/icons/close.svg',  width: 16),
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/tickets.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              slidableController.openStartActionPane();
                            },
                            child: SvgPicture.asset('assets/icons/driver.svg', width: 25,),
                          ),
                         Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => Landing(),
                                ),
                              );
                            },
                            child: Text(
                              'NEXUSMUSEUM',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 20,
                                color: background,
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset('assets/icons/profile.svg',  width: 20),
                          ),
                        ],
                      ),
                      Spacer(),
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
                            'Билеты',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Категории',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(200, 45),
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                color: Colors.grey,
                                width: 1
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(1)),
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              'Постоянные экспозиции',
                              style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(1)),
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              'Выставки',
                              style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(1)),
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              'События',
                              style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(110, 45),
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(1)),
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              'Экскурсии',
                              style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60,),
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
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 13),
                              Text(
                                'Место проведения',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 13),
                              Text(
                                'Дата',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 15),
                          Column(
                            children: [
                              Text(
                                '→',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 13),
                              Text(
                                '→',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 13),
                              Text(
                                '→',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60,),
                    Padding(padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [Text('5 октября 2025 г., 19:30', style: GoogleFonts.inter(
                            fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey
                          ),),
                            Spacer(),
                            Text('Третьяковская галерея, Новая\nТретьяковка, Крымский Вал, 10  ', style: GoogleFonts.inter(
                                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey
                            ),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Корзина',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Количество',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),
                            ),
                            Spacer(),
                            Text('Стоимость',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),
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
                            Text('${900 * quantity} ₽',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Text('Итого:',
                                style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: error),),
                            Spacer(),
                            Text('${900 * quantity} ₽',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: error,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                        color: gold,
                                        width: 1
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(1)),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: Text(
                                    'Продолжить покупки',
                                    style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(150, 45),
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(1)),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: Text(
                                    'Оформить покупки',
                                    style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ),
                    SizedBox(height: 50,),
                    FooterProject(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
