import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/globalData.dart';
import 'package:bnflp_wireframe/widgets/logo.dart';
import 'package:bnflp_wireframe/widgets/mobileDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

createNavBar(
  BuildContext context,
  String title,
  bool isHome,
  String previousPageTitle,
  bool isMobile,
) {
  if (isMobile) {
    // return CupertinoNavigationBar.large(
    //   largeTitle: Text(
    //     title,
    //     style: TextStyle(color: Colors.black, fontFamily: "Outfit"),
    //     softWrap: true,
    //   ),
    //   border: Border.all(color: Colors.transparent),
    //   backgroundColor: const Color.fromARGB(103, 255, 255, 255),
    //   automaticBackgroundVisibility: false,
    //   previousPageTitle: previousPageTitle,
    //   trailing: IconButton(
    //     icon: Icon(CupertinoIcons.chevron_down),
    //     onPressed: () {
    //       Navigator.push(
    //         context,
    //         CupertinoSheetRoute(
    //           builder: (context) {
    //             return Scaffold(
    //               body: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Container(width: double.infinity),
    //                   for (ButtonData buttonData in buttonDataList)
    //                     CupertinoListTile(
    //                       onTap: () {
    //                         context.pop();
    //                         Future.delayed(Duration(milliseconds: 500), () {
    //                           context.go(buttonData.route);
    //                         });
    //                       },
    //                       title: Text(
    //                         buttonData.title,
    //                         style: TextStyle(color: Colors.black),
    //                       ),
    //                       trailing: CupertinoListTileChevron(),
    //                     ),
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     },
    //   ),
    // );
    return AppBar(
      toolbarHeight: 150,
      title: SizedBox(width: 150, child: Logo()),
      actions: [IconButton(
        icon: Icon(CupertinoIcons.chevron_down),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoSheetRoute(
              builder: (context) {
                return NavBarDropdown(parentContext: context);
              },
            ),
          );
        },
      ),],
    );
  }
  return AppBar(
    actions: [
      for (ButtonData buttonData in buttonDataList)
        TextButton(
          onPressed: () {
            context.go(buttonData.route);
          },
          child: Text(
            buttonData.title,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 30,
            ),
          ),
        ),
      Padding(padding: EdgeInsets.only(right: 20)),
    ],
    toolbarHeight: 150,
    leading: Logo(),
    leadingWidth: 190,
    title: Text(
      title,
      style: TextStyle(fontFamily: "Outfit"),
    ),
    // title: IntrinsicWidth(
    //   child: Row(
    //     spacing: 5,
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       for (ButtonData buttonData in buttonDataList)
    //         TextButton(
    //           onPressed: () {
    //             context.go(buttonData.route);
    //           },
    //           child: Text(
    //             buttonData.title,
    //             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.w300,
    //                   fontSize: 30,)
    //           ),
    //         ),
    //     ],
    //   ),
    // ),
  );
}
