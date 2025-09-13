import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets/resources/colors.dart';

class ScannerRowWidget extends StatelessWidget {
  const ScannerRowWidget({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: media.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: media.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(media.height * 0.01),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () async {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/flash.svg',
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(width: media.width * 0.02),
                        const Text(
                          'Flash',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(media.width * 0.02),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/gallery.svg',
                          width: media.width * 0.02,
                          height: media.height * 0.02,
                        ),
                        SizedBox(width: media.width * 0.02),
                        const Text(
                          'Upload from gallery',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
