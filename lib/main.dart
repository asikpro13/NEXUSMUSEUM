import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/landing.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    slidableController ??= SlidableController(this);
  }

  @override
  void dispose() {
    super.dispose();
    slidableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'NEXUSMUSEUM', debugShowCheckedModeBanner: false, home: Landing());
  }
}
