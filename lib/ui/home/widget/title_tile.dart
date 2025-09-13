import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleTile extends StatelessWidget {
  final String title;
  final String img;
  final String trailImg;
  final TextStyle? titlestyle;
  final void Function()? onTap;

  const TitleTile({
    super.key,
    required this.title,
    required this.img,
    this.titlestyle,
    this.trailImg = 'lib/assets/images/arrow.svg',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        img,
        width: 36,
        height: 36,
      ),
      trailing: SvgPicture.asset(
        trailImg,
        width: 15,
        height: 15,
      ),
      title: Text(title,
          style: titlestyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600, letterSpacing: 1)),
      onTap: onTap ??
              () {
            Navigator.pop(context);
          },
    );
  }
}