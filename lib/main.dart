import 'package:flutter/material.dart';
import 'package:nexusmuseum/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEXUSMUSEUM',
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}
