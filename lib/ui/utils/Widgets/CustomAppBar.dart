import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'BoldTextPoppins.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: AppBar(
          elevation: 5,
          titleSpacing: 0,
          leadingWidth: 56,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: BoldTextPoppins(
            text: title,
            color: Colors.black,
            fontSize: 18,
          ),
          leading:IconButton(
        onPressed: onBack,
        icon: SvgPicture.asset(
          "lib/assets/images/back_button.svg",
          width: 30,
          height: 30,
        ),
      ),

    ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
