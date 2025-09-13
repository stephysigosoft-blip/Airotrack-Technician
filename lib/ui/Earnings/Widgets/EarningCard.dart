import 'package:flutter/material.dart';

import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';
import '../../utils/Widgets/BoldTextPoppins.dart';
import '../../utils/Widgets/NormalTextPoppins.dart';

class EarningCard extends StatelessWidget {
  final String location;
  final String product;
  final String amount;
  final Size media;

  const EarningCard(
      {super.key,
        required this.location,
        required this.product,
        required this.amount,
        required this.media});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: media.height * 0.01),
      padding: EdgeInsets.all(media.width * 0.03),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.blue),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalTextPoppins(
                    text: location, color: Colors.black, fontSize: 13),
                SizedBox(height: media.height * 0.005),
                BoldTextPoppins(
                    text: product, color: Colors.black, fontSize: 16)
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_downward_outlined,
                      color: lightGreen, size: 16),
                  SizedBox(width: media.width * 0.01),
                  const Text(Strings.credited,
                      style: TextStyle(color: greyText, fontSize: 12)),
                ],
              ),
              SizedBox(height: media.height * 0.01),
              BoldTextPoppins(text: amount, color: lightGreen, fontSize: 18)
            ],
          )
        ],
      ),
    );
  }
}
