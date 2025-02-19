import 'package:bnflp_wireframe/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bare Necessities for Life Photography',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}

class ImageData {
  final String imagePath;
  final String caption;
  final String location;

  ImageData({
    required this.imagePath,
    required this.caption,
    required this.location,
  });
}

bool isMobile(BoxConstraints constraints) {
  return constraints.maxWidth < 800;
}
