import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/uikit/appBar.dart';
import 'package:nexusmuseum/uikit/colors.dart';
import 'package:nexusmuseum/uikit/drawer.dart';
import 'package:nexusmuseum/uikit/footer.dart';
import 'package:video_player/video_player.dart';

// Экран Виртуальный визит
class VirtualSession extends StatefulWidget {
  const VirtualSession({super.key});

  @override
  State<VirtualSession> createState() => _VirtualSessionState();
}

class _VirtualSessionState extends State<VirtualSession> {
  late VideoPlayerController _controller; // Контроллер видео
  late Future<void> _initializeVideoPlayerFuture; // Индикатор загрузки видео

  // Запуск видео
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/video/vanGogh.mp4');

    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.play(); // Автоматический запуск видко
      _controller.setLooping(true); // Зацикливание видео
      _controller.setVolume(0.0); // Выключение звука
    });
  }

  @override
  // Очищение контроллера
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(width: _controller.value.size.width, height: _controller.value.size.height, child: VideoPlayer(_controller)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 21),
                            child: Column(
                              children: [
                                AppBarProject(isTitle: true),
                                Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 30),
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                        });
                                      },
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(_controller.value.volume > 0 ? Icons.volume_up : Icons.volume_off, color: Colors.white, size: 30),
                                      onPressed: () {
                                        setState(() {
                                          if (_controller.value.volume > 0) {
                                            _controller.setVolume(0.0);
                                          } else {
                                            _controller.setVolume(1.0);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Линия Ван Гога 1853-1890',
                          style: GoogleFonts.inter(fontSize: 20, color: black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Image.asset('assets/images/vanGogh.png'),
                    SizedBox(height: 25),
                    Text(
                      'Корни: Голландские истоки\nТёмные палитры: «Едоки картофеля»\nАнтверпен: Знакомство с цветом\nПариж: Уроки импрессионизма\nПортреты парижской богемы\nАвтопортреты: Диалог с собой\nАрль: В поисках Японии на юге\nЖёлтый дом: Студия мечты\nЗал Подсолнухов\nЦветущие сады\nПоля Прованса\nСеятели и жнецы\nНочная терраса кафе\nВан Гог и Гоген: Напряжённое сотрудничество\nПосле ссоры: «Комната в Арле»\nКипарисы: Пламя земли\nСен-Реми: Приют Сен-Поль\nОливы: между небом и землёй\nИрисы и розы\nЗвёздные ночи\nВихри и спирали\nОвер-сюр-Уаз: Последнее пристанище\nДоктор Гаше: Последний покровитель\nПшеничные поля: бесконечность и покой\nГрафика: сила линии\nПисьма к Тео: Исповедь художника\nЯпонские гравюры: источник вдохновения\nМир глазами Ван Гога (зал для эскизов и набросков)\nМиф о безумном гении\nВан Гог в кино\nЭпилог: Бессмертие. Влияние на искусство XX века',
                      style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500, color: black, height: 1.7),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FooterProject(),
            ],
          ),
        ),
      ),
    );
  }
}
