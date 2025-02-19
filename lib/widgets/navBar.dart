import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CupertinoNavigationBar createNavBar(BuildContext context, String title, bool isHome) {
  return CupertinoNavigationBar.large(
    largeTitle: Text(
      title,
      style: TextStyle(color: Colors.black),
      softWrap: true,
    ),
    border: Border.all(color: Colors.transparent),
    backgroundColor: const Color.fromARGB(103, 255, 255, 255),
    automaticBackgroundVisibility: false,
    leading: isHome ? null : CupertinoNavigationBarBackButton(
      onPressed: () {
        if (context.canPop()) {
          context.pop();
        }
      },
      previousPageTitle: "Back",
      color: Colors.black,
    ),
    trailing: IntrinsicWidth(
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              context.go('/');
            },
            child: Text("Home", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {},
            child: Text("About Me", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {
              context.push('/galleries');
            },
            child: Text("Galleries", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    ),
  );
}
