import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../assets/resources/colors.dart';
import '../../assets/resources/strings.dart';

class JobItem extends StatefulWidget {
  final VoidCallback onAcceptTapped;

  const JobItem({super.key, required this.onAcceptTapped});

  @override
  State<JobItem> createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: lightBlue,
        border: Border.all(color: lightBlue),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Camera",
                style: TextStyle(
                    color: greytext,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins-Regular'),
              ),
              Text(
                "₹1200",
                style: TextStyle(
                    color: lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins-Regular'),
              ),
            ],
          ),
          const Text(
            "New Installation",
            style: TextStyle(
                color: greytext,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Regular'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(children: [
            Icon(
              Icons.location_on,
              color: colorPrimary,
              size: 16,
            ),
            SizedBox(width: 5),
            Text(
              "Mullakkal",
              style: TextStyle(
                  color: greytext,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins-Regular'),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Accept job to see more details",
            style: TextStyle(
                color: greytext,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Regular'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              onPressed:widget.onAcceptTapped,
              child: const Text(
                "Accept",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
