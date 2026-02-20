import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';

import '../../assets/resources/colors.dart';

class JobItem extends StatefulWidget {
  final VoidCallback onAcceptTapped;
  final String deviceName;
  final String workType;
  final String location;
  final String price;
  final bool? isUpcoming;
  final String? createdDate;

  const JobItem(
      {super.key,
      required this.onAcceptTapped,
      required this.deviceName,
      required this.workType,
      required this.location,
      required this.price,
      this.isUpcoming,
      this.createdDate});

  @override
  State<JobItem> createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.deviceName,
                style: const TextStyle(
                    color: greytext,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins-Regular'),
              ),
              Text(
                '₹${(double.tryParse(widget.price.toString()) ?? 0).toStringAsFixed(0)}',
                style: const TextStyle(
                    color: lightGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins-Regular'),
              ),
            ],
          ),
          Text(
            widget.workType,
            style: const TextStyle(
                color: greytext,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Regular'),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Icon(
              Icons.location_on,
              color: colorPrimary,
              size: 16,
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: media.width * 0.70,
              child: Text(
                widget.location,
                maxLines: 2,
                style: const TextStyle(
                    color: greytext,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins-Regular'),
              ),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Accept job to see more details",
            style: TextStyle(
                color: greytext,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Regular'),
          ),
          const SizedBox(
            height: 5,
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
              onPressed: widget.onAcceptTapped,
              child: Text(
                widget.isUpcoming == true ? Strings.jobDetails : Strings.accept,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          if (widget.createdDate != null && widget.createdDate!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${Strings.createdDate}${widget.createdDate}",
                style: const TextStyle(
                    color: greytext,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins-Regular'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
