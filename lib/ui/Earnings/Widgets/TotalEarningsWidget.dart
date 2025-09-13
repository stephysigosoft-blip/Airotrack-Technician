import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';

import '../../utils/Widgets/BoldTextPoppins.dart';

class TotalEarningsWidget extends StatelessWidget {
  final Size media;
  final String fromDate;
  final String toDate;
  final String totalAmount;

  const TotalEarningsWidget(
      {super.key,
      required this.media,
      required this.fromDate,
      required this.toDate,
      required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(media.width * 0.04),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoldTextPoppins(
              text: Strings.totalEarnings, color: Colors.black, fontSize: 20),
          SizedBox(height: media.height * 0.008),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
              children: [
                const TextSpan(
                    text: Strings.fromWithSpace,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins-Regular')),
                TextSpan(
                  text: fromDate,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                    text: Strings.toWithSpace,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins-Regular')),
                TextSpan(
                  text: toDate,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: media.height * 0.012),
          Text(
            totalAmount,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: lightGreen,
            ),
          ),
        ],
      ),
    );
  }
}
