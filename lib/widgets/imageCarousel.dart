import 'package:bnflp_wireframe/config/config.dart';
import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/widgets/carouselButtons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<ImageData> images;
  final double aspectRatio;
  final BuildContext parentContext;

  const ImageCarousel({
    super.key,
    required this.images,
    required this.aspectRatio,
    required this.parentContext,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(top: isMobile(context) ? 0 : 0),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              CarouselSlider.builder(
                itemCount: widget.images.length,
                itemBuilder: (context, index, index1) {
                  return Padding(
                    padding: EdgeInsets.all(isMobile(context) ? 0 : 10),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        SizedBox.expand(
                          child: Hero(
                              transitionOnUserGestures: true,
                              tag: widget.images[index].imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  isMobile(context) ? 0 : 20,
                                ),
                                child: Image.asset(
                                    isWireframe ? "assets/verticalPlaceholder.png" : widget.images[index].imagePath,
                                    fit: BoxFit.cover,
                                ),
                              )),
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
              
                options: getCarouselOptions(widget.aspectRatio, context),
                carouselController: carouselController,
              ),
              PreviousImageButton(carouselController: carouselController),
              NextImageButton(carouselController: carouselController),
            ],
          ),
        );
      },
    );
  }
}
