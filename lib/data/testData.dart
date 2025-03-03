import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:flutter/foundation.dart';

List<ImageData> images = [
  ImageData(
    imagePath: 'assets/1.jpg',
    caption: "Morning Full Moon Reflection",
    location: "Sugar Creek",
  ),
  ImageData(
    imagePath: 'assets/2.jpg',
    caption:
        "Bishop Castle in Rye, CO allows visitors to explore at their own risk and provides you an experience you will never forget.",
    location: "Bishop Castle",
  ),
  ImageData(
    imagePath: 'assets/3.jpg',
    caption: "Frozen Pond Sunrise",
    location: "Sugar Creek",
  ),
  ImageData(
    imagePath: 'assets/4.jpg',
    caption: "A morning view of Pikes Peak from Garden of the Gods",
    location: "Garden of the Gods",
  ),
];

List<GalleryData> galleries = [
  GalleryData(
    url: 'local',
    images: [
      ImageData(
        imagePath: 'assets/1.jpg',
        caption: "Morning Full Moon Reflection",
        location: "Sugar Creek",
      ),
      ImageData(
        imagePath: 'assets/3.jpg',
        caption: "Frozen Pond Sunrise",
        location: "Sugar Creek",
      ),
      ImageData(
        imagePath: 'assets/5.jpg',
        caption: "A picture of a cute dog",
        location: "Waukee",
      ),
      ImageData(
        imagePath: 'assets/6.jpg',
        caption: "A picture of a Bridge",
        location: "Centennial Park",
      ),
      ImageData(imagePath: 'assets/7.jpg', caption: "The Centennial Park Bridge", location: "Centennial Park"),
      ImageData(
        imagePath: 'assets/8.jpg',
        caption: "A picture of a bridge",
        location: "Unknown",
      ),
      ImageData(
        imagePath: 'assets/9.jpg',
        caption: "A picture of a bull",
        location: "Rural Iowa",
      ),
    ],
    galleryName: "Local",
  ),
  GalleryData(
    url: 'colorado',
    images: [
      ImageData(
        imagePath: 'assets/4.jpg',
        caption: "A morning view of Pikes Peak from Garden of the Gods",
        location: "Garden of the Gods",
      ),
      ImageData(
        imagePath: 'assets/2.jpg',
        caption:
            "Bishop Castle in Rye, CO allows visitors to explore at their own risk and provides you an experience you will never forget.",
        location: "Bishop Castle",
      ),
    ],
    galleryName: "Colorado",
  ),
];

bool isWireframe = false;
