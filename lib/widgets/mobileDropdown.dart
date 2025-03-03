import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/globalData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarDropdown extends StatelessWidget {
  const NavBarDropdown({super.key, required this.parentContext});
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [IconButton(
        icon: Icon(CupertinoIcons.chevron_down),
        onPressed: () {
          context.pop();
        },
      ),]
      ),
      body: ListView(
        children: [
          Container(width: double.infinity),
          for (ButtonData buttonData in buttonDataList)
            CupertinoListTile(
              onTap: () {
                parentContext.pop();
                Future.delayed(Duration(milliseconds: 500), () {
                  parentContext.go(buttonData.route);
                });
              },
              title: Text(
                buttonData.title,
                style: TextStyle(color: Colors.black),
              ),
              trailing: CupertinoListTileChevron(),
            ),
        ],
      ),
    );
  }
}
