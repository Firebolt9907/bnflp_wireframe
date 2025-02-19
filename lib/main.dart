import 'package:bnflp_wireframe/routes.dart';
import 'package:flutter/foundation.dart';
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
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            defaultTargetPlatform: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: router,
    );
  }
}

class GalleryData {
  final List<ImageData> images;
  final String galleryName;
  final String url;

  GalleryData({required this.images, required this.url, required this.galleryName});
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
