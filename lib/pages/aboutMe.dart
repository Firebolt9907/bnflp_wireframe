

import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/widgets/aboutMeBlurb.dart';
import 'package:bnflp_wireframe/widgets/footer.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:flutter/cupertino.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: createNavBar(context, "About Tim Hanson", false, "Home", isMobile(context)),
        child: ListView(
            children: [
              AboutMeBlurb(parentContext: context),
              Footer(),
            ],
          ),
    );
  }
}