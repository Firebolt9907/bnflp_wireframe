import 'package:flutter/material.dart';

class ButtonData {
  final String title;
  final String route;

  ButtonData({required this.title, required this.route});
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

bool isMobile(BuildContext context) {
  return MediaQuery.sizeOf(context).width < 800;
}

class GalleryData {
  final List<ImageData> images;
  final String galleryName;
  final String url;

  GalleryData({
    required this.images,
    required this.url,
    required this.galleryName,
  });
}

