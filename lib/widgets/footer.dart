import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      width: double.infinity,
      color: Colors.grey[800],
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (isMobile(context)) {
            return Column(
              spacing: 10,
              children: [
                CopyrightText(context, true),
                SocialMediaButtons(context, true)
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CopyrightText(context, false), SocialMediaButtons(context, false)],
            );
          }
        },
      ),
    );
  }

  Widget CopyrightText(BuildContext context, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            'Bare Necessities of Life Photography',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '© 2025 Bare Necessities of Life Photography.\nAll rights reserved.',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.white70,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget SocialMediaButtons(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(top: isMobile ? 0 : 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          Text(
            'Follow Me',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.ios_share),
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.email),
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
