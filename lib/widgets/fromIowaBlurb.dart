import 'dart:math';

import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:flutter/material.dart';

class IowaBlurb extends StatelessWidget {
  const IowaBlurb({super.key, required this.parentContext});
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile(context)) {
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
                    width: min(
                      MediaQuery.sizeOf(context).width * 0.4,
                      MediaQuery.sizeOf(context).height * 0.5,
                    ),
                    child: Image.asset('assets/pfp.jpg'),
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
