import 'package:airotrackgit/Controller/EarningsController.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/Widgets/BoldTextPoppins.dart';

class DateSelectionWidget extends StatelessWidget {
  const DateSelectionWidget(
      {super.key,
      required this.media,
      required this.fromDate,
      required this.toDate,
      required this.onFromDateTap,
      required this.onToDateTap});

  final Size media;
  final String fromDate;
  final String toDate;
  final VoidCallback? onFromDateTap;
  final VoidCallback? onToDateTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DateBox(media: media, date: fromDate, onTapped: onFromDateTap),
        SizedBox(width: media.width * 0.03),
        DateBox(media: media, date: toDate, onTapped: onToDateTap),
      ],
    );
  }
}

class DateBox extends StatelessWidget {
  const DateBox(
      {super.key,
      required this.media,
      required this.date,
      required this.onTapped});

  final Size media;
  final String date;
  final VoidCallback? onTapped;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTapped,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: media.height * 0.013,
            horizontal: media.width * 0.03,
          ),
          decoration: BoxDecoration(
            color: textFieldFillColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              BoldTextPoppins(text: date, color: Colors.black, fontSize: 15),
              const Spacer(),
              SvgPicture.asset("lib/assets/images/date_icon.svg")
            ],
          ),
        ),
      ),
    );
  }
}
