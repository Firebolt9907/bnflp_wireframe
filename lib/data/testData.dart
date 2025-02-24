
  import 'package:bnflp_wireframe/data/dataTypes.dart';

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