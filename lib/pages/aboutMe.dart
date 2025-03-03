

import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/widgets/aboutMeBlurb.dart';
import 'package:bnflp_wireframe/widgets/awardBlurb.dart';
import 'package:bnflp_wireframe/widgets/footer.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createNavBar(context, "About Tim Hanson", false, "Home", isMobile(context)),
        body: ListView(
            children: [
              AboutMeBlurb(parentContext: context),
              AwardBlurb(),
              Footer(),
            ],
          ),
    );
  }
}