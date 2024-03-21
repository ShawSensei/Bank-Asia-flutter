import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color: kWhiteColor),),
      titleSpacing: 10,
      centerTitle: true,
      toolbarHeight: 80,
      toolbarOpacity: 0.8,
      shadowColor: kWhiteColor,
      elevation: 20.0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back),
        color: kWhiteColor,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
