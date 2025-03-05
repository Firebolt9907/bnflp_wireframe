import 'dart:math';
import 'dart:ui';

import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/pages/purchasePage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryImage extends StatefulWidget {
  final ImageData image;
  final BuildContext parentContext;
  final double imagesScrolled;
  final int index;

  const GalleryImage({
    super.key,
    required this.parentContext,
    required this.image,
    required this.imagesScrolled,
    required this.index,
  });

  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile(widget.parentContext)) {
          if (MediaQuery.sizeOf(widget.parentContext).height > 800) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                GestureDetector(
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
                  child: Transform.scale(
                    scale:
                        0.7 +
                        0.3 *
                            (1 - (widget.index - widget.imagesScrolled).abs()),
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: widget.image.imagePath,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ((widget.index - widget.imagesScrolled).abs()) * 80,
                        ),
                        child: IntrinsicHeight(
                          child: Image.asset(
                            isWireframe
                                ? "assets/verticalPlaceholder.png"
                                : widget.image.imagePath,
                            fit:
                                isMobile(context)
                                    ? BoxFit.contain
                                    : BoxFit.cover,
                            height:
                                isMobile(context)
                                    ? null
                                    : MediaQuery.sizeOf(context).height - 170,
                            width:
                                isMobile(context)
                                    ? MediaQuery.sizeOf(context).width
                                    : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    ((widget.index - widget.imagesScrolled)) *
                        MediaQuery.sizeOf(context).width,
                    ((widget.imagesScrolled - widget.index)) *
                        (MediaQuery.sizeOf(context).height - 150),
                  ),
                  child: ShowMoreButton(widget.image),
                ),
              ],
            );
          } else {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 90),
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
                      child: Transform.scale(
                        scale:
                            0.7 +
                            0.3 *
                                (1 - (widget.index - widget.imagesScrolled).abs()),
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: widget.image.imagePath,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              ((widget.index - widget.imagesScrolled).abs()) * 80,
                            ),
                            child: IntrinsicHeight(
                              child: Image.asset(
                                isWireframe
                                    ? "assets/verticalPlaceholder.png"
                                    : widget.image.imagePath,
                                fit:
                                    isMobile(context)
                                        ? BoxFit.contain
                                        : BoxFit.cover,
                                height:
                                    isMobile(context)
                                        ? null
                                        : MediaQuery.sizeOf(context).height - 170,
                                width:
                                    isMobile(context)
                                        ? MediaQuery.sizeOf(context).width
                                        : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    ((widget.index - widget.imagesScrolled)) *
                        MediaQuery.sizeOf(context).width,
                    ((widget.imagesScrolled - widget.index)) *
                        (MediaQuery.sizeOf(context).height - 150),
                  ),
                  child: ShowMoreButton(widget.image),
                ),
              ],
            );
          }
        }
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
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
                  child: Transform.scale(
                    scale:
                        0.7 +
                        0.3 *
                            (1 - (widget.index - widget.imagesScrolled).abs()),
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: widget.image.imagePath,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ((widget.index - widget.imagesScrolled).abs()) * 80,
                        ),
                        child: IntrinsicHeight(
                          child: Image.asset(
                            isWireframe
                                ? "assets/verticalPlaceholder.png"
                                : widget.image.imagePath,
                            fit:
                                isMobile(context)
                                    ? BoxFit.contain
                                    : BoxFit.cover,
                            height: MediaQuery.sizeOf(context).height - 180,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(
                ((widget.index - widget.imagesScrolled).abs()) * 540,
                0,
              ),
              child: ShowMoreButton(widget.image),
            ),
          ],
        );
      },
    );
  }

  Widget ShowMoreButton(ImageData image) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            isMobile(context)
                ? min(
                  ((widget.index - widget.imagesScrolled).abs()) *
                      MediaQuery.sizeOf(context).width *
                      2,
                  20,
                )
                : 20,
        vertical:
            isMobile(context)
                ? min(
                  ((widget.index - widget.imagesScrolled).abs()) *
                      MediaQuery.sizeOf(context).width,
                  10,
                )
                : 10,
      ),
      child: SizedBox(
        width: min(500, MediaQuery.sizeOf(context).width),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            isMobile(context)
                ? min(
                  ((widget.index - widget.imagesScrolled).abs()) *
                      MediaQuery.sizeOf(context).width,
                  10,
                )
                : 10,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(150, 188, 188, 188),
                borderRadius: BorderRadius.circular(
                  isMobile(context)
                      ? min(
                        ((widget.index - widget.imagesScrolled).abs()) *
                            MediaQuery.sizeOf(context).width,
                        10,
                      )
                      : 10,
                ),
              ),
              child: IntrinsicHeight(
                child: Column(
                  spacing: 10,
                  children: [
                    Hero(
                      tag: "${image.imagePath}caption",
                      child: Text(
                        widget.image.caption,
                        style: Theme.of(
                          context,
                        ).textTheme.displaySmall!.copyWith(fontSize: 16),
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
                          color: Colors.white.withAlpha(130),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "More Info",
                              textAlign: TextAlign.center,
                            ),
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
      ),
    );
  }
}
