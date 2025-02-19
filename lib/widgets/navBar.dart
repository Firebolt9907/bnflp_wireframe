import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoNavigationBar createNavBar(BuildContext context) {
  return CupertinoNavigationBar.large(
    largeTitle: Text(
      "Bare Necessities of Life Photography",
      style: TextStyle(color: Colors.black),
      softWrap: true,
    ),
    border: Border.all(color: Colors.transparent),
    backgroundColor: const Color.fromARGB(103, 255, 255, 255),
    automaticBackgroundVisibility: false,
    trailing: Row(
      spacing: 5,
      children: [
        TextButton(
          onPressed: () {},
          child: Text("Home", style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("About Me", style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Galleries", style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );
}
