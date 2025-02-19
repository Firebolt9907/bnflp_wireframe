import 'package:bnflp_wireframe/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<ImageData> images;
  final CarouselSliderController? carouselController;
  final double aspectRatio;

  const Carousel({super.key, required this.images, this.carouselController, required this.aspectRatio});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
            itemCount: widget.images.length,
            itemBuilder: (context, index, index1) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: widget.aspectRatio * 1.4,
                        child: Image.asset(
                          widget.images[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Text(
                        widget.images[index].location,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },

            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: widget.aspectRatio * 1.4,
              enlargeCenterPage: true,
              viewportFraction: 1,
              enlargeFactor: 0.4,
              enableInfiniteScroll: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              autoPlayAnimationDuration: Duration(
                milliseconds: (widget.aspectRatio * 800).toInt(),
              ),
              pauseAutoPlayInFiniteScroll: false,
              pauseAutoPlayOnManualNavigate: false,
              pauseAutoPlayOnTouch: false,
            ),
            carouselController: widget.carouselController,
          );
  }
}