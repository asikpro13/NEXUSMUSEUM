import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/exhibitions.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/uikit/colors.dart';

import 'tickets.dart';

// Экран О музее
class AboutMuseum extends StatefulWidget {
  const AboutMuseum({super.key});

  @override
  State<AboutMuseum> createState() => _AboutMuseumPageState();
}

class _AboutMuseumPageState extends State<AboutMuseum>
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
                      image: AssetImage('assets/images/aboutMuseum.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      AppBarProject(isTitle: true),
                      Spacer(),
                      Text(
                        'О МУЗЕЕ',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'NEXUSMUSEUM — Мост между временами и культуры',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 11,
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
                            'Как добраться',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'На общественном транспорте',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Станции метро "Лубянка" (Сокольническая линия) и "Кузнецкий Мост" (Таганско-Краснопресненская линия) — 5 минут пешком',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Автобусы: м1, м2, м3, м6, м7, м9 до остановки "Метро Лубянка"',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Пригородные поезда: до станции "Москва-Каланчёвская", затем 15 минут на метро',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'На автомобиле',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Удобный подъезд с Лубянского проезда',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Парковка: многоуровневый паркинг на 200 мест (вход с Театрального проезда)',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Стоимость парковки: 100 рублей/час, для посетителей музея — первые 2 часа бесплатно',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Где мы находимся',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/map.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'История музея',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'ПРОЛОГ: РОЖДЕНИЕ ЗАМЫСЛА (2010-2014)',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'История Nexusmuseum началась не с закладки фундамента или сбора первой коллекции, а со смелой философской концепции, которую разрабатывали три энтузиаста: искусствовед Анна Городецкая, архитектор-визионер Дмитрий Волков и технолог-новатор Алексей Семёнов. Их объединила идея создания принципиально нового культурного пространства — "музея без границ", где эпохи и художественные языки вступали бы в прямой диалог.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'В течение четырёх лет команда прорабатывала концепцию, изучая лучшие мировые практики и проводя многочисленные исследования. Ключевым моментом стало приобретение в 2013 году заброшенного здания бывшего Индустриального института на Лубянском проезде — памятника конструктивизма 1920-х годов, который идеально соответствовал духу будущего музея своей архитектурной смелостью и исторической многослойностью.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'ЭПОХА СТАНОВЛЕНИЯ (2015-2017)',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Торжественное открытие Nexusmuseum состоялось 15 сентября 2015 года. Первой экспозицией стала "Археология будущего" — провокационный проект, где цифровые инсталляции соседствовали с античными артефактами. Выставка вызвала оживлённые дискуссии в профессиональной среде, но именно этот синтез старого и нового стал визитной карточкой музея.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'В 2016 году музей представил свою первую масштабную выставку "Код культуры", где экспонаты из разных эпох были организованы не по хронологическому, а по тематическому принципу. Посетители могли проследить, как одна и та же идея — например, концепция героизма или образ дерева — воплощалась в искусстве Древнего Египта, Средневековья и цифровой эпохи.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Критическим моментом этого периода стало создание собственного реставрационного центра и начало формирования постоянной коллекции. Особую гордость составило приобретение архива русского авангардиста Петра Лещенко и коллекции античных килик VI века до н.э.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'ПЕРИОД РАСШИРЕНИЯ (2018-2020)',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2018 год ознаменовался масштабной реконструкцией и расширением площадей. Под руководством Дмитрия Волкова был достроен современный корпус с "умными" фасадами, меняющими прозрачность в зависимости от освещения. Технологические решения Алексея Семёнова позволили создать интерактивные залы с дополненной реальностью и иммерсивными инсталляциями.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'В этот период Nexusmuseum начал активно развивать международное сотрудничество. Были заключены партнёрские соглашения с Центром Помпиду в Париже, музеем Гуггенхайма в Бильбао и Токийским национальным музеем. Совместный проект "Трансформация взгляда" с нью-йоркским МОМА стал одним из самых посещаемых в сезоне 2019-2020 годов.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Музей также укрепил свои исследовательские позиции, открыв Лабораторию цифровой гуманитаристики и Школу музейного кураторства. Ежегодная конференция "Nexus: искусство искусство в эпоху технологий" стала важной площадкой для профессионалов со всего мира.',
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
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
