import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../utils/Widgets/BoldTextPoppins.dart';
import '../../utils/Widgets/NormalTextPoppins.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  final Size media;
  final String? amount;
  final String? statusText;

  const JobCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.media,
    this.amount,
    this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: media.height * 0.01),
      padding: EdgeInsets.all(media.width * 0.04),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldTextPoppins(text: title, color: Colors.black, fontSize: 16),
              SizedBox(height: media.height * 0.005),
              BoldTextPoppins(
                  text: subtitle, color: blackShadeJObCard, fontSize: 13),
              SizedBox(height: media.height * 0.005),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: colorPrimary),
                  SizedBox(width: media.width * 0.01),
                  NormalTextPoppins(
                      text: location, color: blackShadeJObCard, fontSize: 13)
                ],
              ),
            ],
          ),
          if (amount != null)
            BoldTextPoppins(text: amount!, color: lightGreen, fontSize: 20)
          else if (statusText != null)
            BoldTextPoppins(
                text: statusText!,
                color: paymentPendingBlue,
                fontSize: 14)
        ],
      ),
    );
  }
}