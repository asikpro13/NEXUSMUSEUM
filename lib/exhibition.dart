import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/exhibitions.dart';
import 'package:nexusmuseum/landing.dart';
import 'package:nexusmuseum/uikit/footerApp.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'globals.dart';
import 'aboutMuseum.dart';

// Экран Exhibition
class ExhibitionPage extends StatefulWidget {
  const ExhibitionPage({super.key});

  @override
  State<ExhibitionPage> createState() => _ExhibitionPageState();
}

class _ExhibitionPageState extends State<ExhibitionPage>
    with SingleTickerProviderStateMixin {
  late final SlidableController slidableController = SlidableController(this);


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
                                child: SvgPicture.asset('assets/icons/close.svg'),
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
                            onTap: () {},
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
                        height: MediaQuery.of(context).size.height * 1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Exhibition.png'),
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
                                  child: SvgPicture.asset('assets/icons/driver.svg'),
                                ),
                                SizedBox(width: 25),
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset('assets/icons/search.svg'),
                                ),
                                SizedBox(width: 27),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => Landing(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '        NEXUSMUSEUM',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 17,
                                      color: background,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset('assets/icons/profile.svg'),
                                ),
                              ],
                            ),
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
                                      decoration: BoxDecoration(
                                        color: background,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'ОКТЯБРЬ 19',
                                          style: GoogleFonts.inter(
                                            fontSize: 15,
                                            color: black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'ПО СЛЕДАМ ТИРАННОЗАВРА:\nПАЛЕОНТОЛОГИЯ\nРАСКРЫВАЕТ ТАЙНЫ',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: background,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Какой была жизнь до появления человека?',
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: background,
                                      ),
                                    ),
                                    SizedBox(height: 35),
                                  ],
                                ),
                              ],
                            ),
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
                'Адрес и часы работы',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_pin, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Корпус «Античность»',
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/images/circle.png',
                    height: 15,
                    width: 15,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Метро Новокузнецкая',
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.call_outlined, size: 18),
                  SizedBox(width: 5),
                  Text(
                    ' 8 (495) 957-456-07',
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Стоимость билетов',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
                  SizedBox(height: 20),
                  Text(
                    'Взрослый — 800 ₽',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Льготные — 0, 350, 400 ₽',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Последний вторник месяца — пенсионеры бесплатно, взрослый 400 ₽',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
              ),
                    Container(
                      height: 100,
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
                              SizedBox(height: 20,),
                              Text(
                                'Описание',
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: background,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'О мероприятии',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Когда Земля была молодой, ими правили гиганты. Приготовьтесь встретиться лицом к лицу с самыми могущественными существами, когда-либо ходившими по планете! Наша масштабная выставка перенесёт вас на миллионы лет назад, в эпоху, когда воздух дрожал от рёва тираннозавра, а земля содрогалась под тяжестью шагов брахиозавров. Вас ждут полномасштабные скелеты и реконструкции легендарных динозавров в натуральную величину, интерактивные зоны где вы почувствуете себя палеонтологом проводя раскопки в специальной песочнице, дополненная реальность которая оживит древних гигантов с помощью вашего смартфона, а также уникальные экспонаты — череп трицератопса, когти велоцираптора и окаменелости найденные в нашем регионе. Это путешествие во времени которое перевернёт ваше представление о мире. Осмелитесь ли вы заглянуть в прошлое?',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 40,),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
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
                          ),
                          SizedBox(height: 40,),
                          Text(
                            'Фотогалерея',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20,),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: exhibitionList.length - 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(exhibitionsList[index]),
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
                                          width: 120,
                                          child: Text(
                                            titleExhibitionsList[index],
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
                        ],
                      ),
                    ),
                  ],
              ),
                      SizedBox(height: 70,),
                      FooterApp()
                    ],
                ),
              ),
            ),
        )
    );
    }
}