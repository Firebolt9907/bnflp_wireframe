import 'dart:math';
import 'dart:ui';

import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/pages/purchasePage.dart';
import 'package:bnflp_wireframe/widgets/carouselButtons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryImage extends StatefulWidget {
  final ImageData image;
  final BuildContext parentContext;

  const GalleryImage({
    super.key,
    required this.parentContext,
    required this.image,
  });

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile(widget.parentContext)) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    widget.parentContext,
                    CupertinoPageRoute(
                      builder: (context) {
                        return PurchasePage(image: widget.image);
                      },
                    ),
                  );
                },
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: widget.image.imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: IntrinsicHeight(
                      child: Image.asset(
                        isWireframe ? "assets/verticalPlaceholder.png" : widget.image.imagePath,
                        fit: isMobile(context) ? BoxFit.contain : BoxFit.cover,
                        height:
                            isMobile(context)
                                ? null
                                : MediaQuery.sizeOf(context).height - 170,
                        width:
                            isMobile(context)
                                ? MediaQuery.sizeOf(context).width - 20
                                : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ShowMoreButton(widget.image),),
          ],
        );
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    widget.parentContext,
                    CupertinoPageRoute(
                      builder: (context) {
                        return PurchasePage(image: widget.image);
                      },
                    ),
                  );
                },
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: widget.image.imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: IntrinsicHeight(
                      child: Image.asset(
                        isWireframe ? "assets/verticalPlaceholder.png" : widget.image.imagePath,
                        fit: isMobile(context) ? BoxFit.contain : BoxFit.cover,
                        height:
                            isMobile(context)
                                ? null
                                : MediaQuery.sizeOf(context).height - 170,
                        width:
                            isMobile(context)
                                ? MediaQuery.sizeOf(context).width - 20
                                : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ShowMoreButton(widget.image),
          ],
        );
      },
    );
  }

  Widget ShowMoreButton(ImageData image) {
    return Positioned(
              bottom: 20,
              right: 20,
              width: min(340, MediaQuery.sizeOf(context).width - 40),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(150, 188, 188, 188),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        spacing: 10,
                        children: [
                          Hero(
                            tag: "${image.imagePath}caption",
                            child: Text(
                              widget.image.caption,
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                widget.parentContext,
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return PurchasePage(image: image);
                                  },
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white.withAlpha(100),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Text("More Info", textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
  }
}
