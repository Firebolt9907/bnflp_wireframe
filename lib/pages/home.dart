import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/widgets/aboutMeBlurb.dart';
import 'package:bnflp_wireframe/widgets/footer.dart';
import 'package:bnflp_wireframe/widgets/imageCarousel.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.sizeOf(context).width / MediaQuery.sizeOf(context).height;
    return CupertinoPageScaffold(
      navigationBar: createNavBar(
        context,
        "Bare Necessities of Life Photography",
        true,
        "",
        isMobile(context),
      ),

      child: ListView(
        children: [
          GestureDetector(
            child: ImageCarousel(
              images: images,
              aspectRatio: aspectRatio,
              parentContext: context,
            ),
            onTap: () {
              context.push('/galleries');
            },
          ),
          AboutMeBlurb(parentContext: context),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "[THIS CANNOT BE USED AS THE FINAL HOME PAGE DUE TO SEO ISSUES]",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displaySmall!.copyWith(color: Colors.red),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
