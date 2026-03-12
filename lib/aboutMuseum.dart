import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/const.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/social.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Экран О музее
class AboutMuseum extends StatefulWidget {
  const AboutMuseum({super.key});

  @override
  State<AboutMuseum> createState() => _AboutMuseumPageState();
}

class _AboutMuseumPageState extends State<AboutMuseum> {
  final MapController mapController = MapController();
  bool _isMapLoaded = false;

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
                  image: DecorationImage(image: AssetImage('assets/images/aboutMuseum.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarProject(isTitle: true),
                    Spacer(),
                    Text(
                      'О МУЗЕЕ',
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('NEXUSMUSEUM — Мост между временами и культуры', style: GoogleFonts.inter(color: Colors.white, fontSize: 11)),
                    SizedBox(height: 20),
                    SocialNetworks(),
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
                        Text('Адрес и часы работы', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/geo.svg', width: 15,),
                            SizedBox(width: 12),
                            Text('Корпус «Античность»', style: GoogleFonts.inter(fontSize: 16)),
                          ],
                        ),
                        SizedBox(height: 13),
                        Row(
                          children: [
                            Image.asset('assets/images/circle.png', height: 13, width: 13),
                            SizedBox(width: 12),
                            Text('метро Новокузнецкая', style: GoogleFonts.inter(fontSize: 16)),
                          ],
                        ),
                        SizedBox(height: 13),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/phone.svg', width: 15),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                launchUrlString(phoneUrl, mode: LaunchMode.externalApplication);
                              },
                              child: Text(phoneNumber, style: GoogleFonts.inter(fontSize: 16)),
                            ),
                          ],
                        ),
                        SizedBox(height: 13),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SvgPicture.asset('assets/icons/clock.svg',  width: 15),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                'ВС, ВТ, СР: 10:00 — 18:00 (кассы и вход до 17:00)\nПН: выходной\nЧТ, ПТ, СБ: 10:00 — 21:00 (кассы и вход до 20:00)',
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text('Как добраться', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text('На общественном транспорте', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text('Станции метро "Лубянка" (Сокольническая линия) и "Кузнецкий Мост" (Таганско-Краснопресненская линия) — 5 минут пешком', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 20),
                        Text('Автобусы: м1, м2, м3, м6, м7, м9 до остановки "Метро Лубянка"', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 20),
                        Text('Пригородные поезда: до станции "Москва-Каланчёвская", затем 15 минут на метро', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 20),
                        Text('На автомобиле', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text('Удобный подъезд с Лубянского проезда', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 20),
                        Text('Парковка: многоуровневый паркинг на 200 мест (вход с Театрального проезда)', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 20),
                        Text('Стоимость парковки: 100 рублей/час, для посетителей музея — первые 2 часа бесплатно', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 30),
                        Text('Где мы находимся', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          initialZoom: 16,
                          initialCenter: museumLocation,
                          onMapReady: () {
                            setState(() => isMapLoaded = true);
                          },
                        ),
                        children: [
                          TileLayer(urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png', subdomains: const ['a', 'b', 'c'], userAgentPackageName: 'nexusmuseum'),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: museumLocation,
                                width: 50,
                                height: 50,
                                child: GestureDetector(
                                  onTap: () => showMuseumInfo(context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: error,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3),
                                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 2))],
                                    ),
                                    child: const Icon(Icons.place, color: Colors.white, size: 30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('История музея', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('ПРОЛОГ: РОЖДЕНИЕ ЗАМЫСЛА (2010-2014)', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
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
                        Text('ЭПОХА СТАНОВЛЕНИЯ (2015-2017)', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
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
                        Text('ПЕРИОД РАСШИРЕНИЯ (2018-2020)', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
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
    );
  }
}
