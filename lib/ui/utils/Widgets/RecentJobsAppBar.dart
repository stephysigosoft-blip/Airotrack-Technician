import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';

class RecentJobsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTap;

  const RecentJobsAppBar({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorPrimary,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: onTap,
      ),
      title: BoldTextPoppins(
        text: title,
        color: Colors.white,
        fontSize: 18,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
