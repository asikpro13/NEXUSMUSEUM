import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/tickets.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/social.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'globals.dart';

// Экран Выставка
class ExhibitionPage extends StatefulWidget {
  const ExhibitionPage({super.key});

  @override
  State<ExhibitionPage> createState() => _ExhibitionPageState();
}

class _ExhibitionPageState extends State<ExhibitionPage>
    with SingleTickerProviderStateMixin {

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
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/Exhibition.png'), fit: BoxFit.cover),
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
                                child: Text('ОКТЯБРЬ 19', style: GoogleFonts.inter(fontSize: 15, color: black)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'ПО СЛЕДАМ ТИРАННОЗАВРА:\nПАЛЕОНТОЛОГИЯ\nРАСКРЫВАЕТ ТАЙНЫ',
                              style: GoogleFonts.inter(fontSize: 15, color: background, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text('Какой была жизнь до появления человека?', style: GoogleFonts.inter(fontSize: 13, color: background)),
                            SizedBox(height: 35),
                          ],
                        ),
                      ],
                    ),
                    SocialNetworks()
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
                              width: 300,
                              child: Text(
                                'ВС, ВТ, СР: 10:00 — 18:00 (кассы и вход до 17:00)\nПН: выходной\nЧТ, ПТ, СБ: 10:00 — 21:00 (кассы и вход до 20:00)',
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text('Стоимость билетов', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text('Взрослый — 800 ₽', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 10),
                        Text('Льготные — 0, 350, 400 ₽', style: GoogleFonts.inter(fontSize: 16)),
                        SizedBox(height: 10),
                        Text('Последний вторник месяца — пенсионеры бесплатно, взрослый 400 ₽', style: GoogleFonts.inter(fontSize: 16)),
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
                            SizedBox(height: 20),
                            Text(
                              'Описание',
                              style: GoogleFonts.inter(fontSize: 20, color: background, fontWeight: FontWeight.w400),
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
                        Text('О мероприятии', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(
                          'Когда Земля была молодой, ими правили гиганты. Приготовьтесь встретиться лицом к лицу с самыми могущественными существами, когда-либо ходившими по планете! Наша масштабная выставка перенесёт вас на миллионы лет назад, в эпоху, когда воздух дрожал от рёва тираннозавра, а земля содрогалась под тяжестью шагов брахиозавров. Вас ждут полномасштабные скелеты и реконструкции легендарных динозавров в натуральную величину, интерактивные зоны где вы почувствуете себя палеонтологом проводя раскопки в специальной песочнице, дополненная реальность которая оживит древних гигантов с помощью вашего смартфона, а также уникальные экспонаты — череп трицератопса, когти велоцираптора и окаменелости найденные в нашем регионе. Это путешествие во времени которое перевернёт ваше представление о мире. Осмелитесь ли вы заглянуть в прошлое?',
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TicketsPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(200, 45),
                              backgroundColor: error,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                              elevation: 5,
                            ),
                            child: Text('Купить билеты', style: GoogleFonts.inter(fontSize: 16, color: white)),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text('Фотогалерея', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: exhibitionList.length - 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(6),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(exhibitionsList[index]), fit: BoxFit.cover),
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
                                          style: GoogleFonts.inter(fontSize: 7, color: white),
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
              SizedBox(height: 70),
              FooterProject(),
            ],
          ),
        ),
      ),
    );
  }
}
