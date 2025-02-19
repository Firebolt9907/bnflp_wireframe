import 'dart:math';

import 'package:bnflp_wireframe/main.dart';
import 'package:flutter/material.dart';

class AboutMeBlurb extends StatelessWidget {
  const AboutMeBlurb({super.key, required this.parentContext});
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                          style: Theme.of(
                            context,
                          ).textTheme.headlineLarge!.copyWith(
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
                  child: SizedBox(
                    child: Image.asset('assets/pfp.jpg'),
                    width: min(
                      MediaQuery.sizeOf(context).width * 0.4,
                      MediaQuery.sizeOf(context).height * 0.5,
                    ),
                  ),
                ),
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
                          style: Theme.of(
                            context,
                          ).textTheme.headlineLarge!.copyWith(
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
    );
  }
}
