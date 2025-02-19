import 'dart:io';
import 'dart:math';

import 'package:bnflp_wireframe/widgets/carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bare Necessities for Life Photography',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.sizeOf(context).width / MediaQuery.sizeOf(context).height;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar.large(
        largeTitle: Text("Bare Necessities of Life Photography"),
        border: Border.all(color: Colors.transparent),
        backgroundColor: Colors.transparent,
        trailing: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoSheetRoute(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text("Test"),
                      transitionBetweenRoutes: false,
                    ),
                    child: Center(
                      child: Text("Test"),
                    ),
                  );
                },
              ),
            );
          },
          icon: Icon(CupertinoIcons.add),
        ),
        leading: Row(
          spacing: 5,
          children: [
            TextButton(onPressed: () {}, child: Text("Home")),
            TextButton(onPressed: () {}, child: Text("About Me")),
            TextButton(onPressed: () {}, child: Text("Gallery")),
          ],
        ),
      ),

      child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 60)),
          GestureDetector(
            child: Carousel(
              images: images,
              carouselController: carouselController,
              aspectRatio: aspectRatio,
            ),
            onTap: () {
              Navigator.push(
                            context,
                            CupertinoSheetRoute(
                              builder: (context) {
                                return CupertinoPageScaffold(
                                  child: Carousel(images: images, aspectRatio: aspectRatio),
                                );
                              },
                            ),
                          );
            },
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile(constraints)) {
                return Column(
                  children: [
                    Image.asset('assets/pfp.jpg'),
                    SizedBox(
                      width: double.infinity,
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About Tim Hanson",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "Hello, I'm a photographer who loves to capture the beauty of nature. I have been taking photos for over 10 years and have a passion for capturing the beauty of the world around me. I hope you enjoy my work and feel free to reach out to me if you have any questions or would like to purchase a print of any of my photos. -ChatGPT",
                                style: Theme.of(context).textTheme.bodyLarge,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                        child: SizedBox(child: Image.asset('assets/pfp.jpg'), width: min(MediaQuery.sizeOf(context).width * 0.4, MediaQuery.sizeOf(context).height * 0.5),)),
                    ),
                    Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: IntrinsicHeight(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About Tim Hanson",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "Hello, I'm a photographer who loves to capture the beauty of nature. I have been taking photos for over 10 years and have a passion for capturing the beauty of the world around me. I hope you enjoy my work and feel free to reach out to me if you have any questions or would like to purchase a print of any of my photos. -ChatGPT",
                                style: Theme.of(context).textTheme.bodyLarge,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
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
  return constraints.maxWidth < 600;
}