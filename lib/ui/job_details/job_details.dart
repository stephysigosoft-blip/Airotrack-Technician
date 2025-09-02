import 'package:airotrackgit/Controller/JobDetailsController.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/CallNowButton.dart';
import 'package:airotrackgit/ui/utils/Widgets/NavigateButton.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../assets/resources/strings.dart';
import '../utils/Widgets/CancelButton.dart';
import '../utils/Widgets/CheckInButton.dart';
import '../utils/Widgets/CustomAppBar.dart';
import '../utils/Widgets/RichtextWidget.dart';
import 'Widgets/RowWidget1.dart';
import 'Widgets/RowWidget2.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return GetBuilder(
      init: JobDetailsController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            title: Strings.jobDetails,
            onBack: () {
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(media.width * 0.04),
          child: SafeArea(
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RowWidget1(
                  name: "Paul C",
                  amount: "₹1200",
                ),
                SizedBox(height: media.height * 0.015),
                RowWidget2(media: media, phoneNumber: "+91 9876543210"),
                SizedBox(height: media.height * 0.015),
                CallNowButton(
                    media: media,
                    text: Strings.callNow,
                    buttonColor: colorPrimary,
                    textColor: Colors.white),
                SizedBox(height: media.height * 0.015),
                const RichTextWidget(
                  text1: Strings.device,
                  text2: "Camera",
                ),
                SizedBox(height: media.height * 0.01),
                const RichTextWidget(
                  text1: Strings.jobType,
                  text2: "New Installation",
                ),
                SizedBox(height: media.height * 0.01),
                const RichTextWidget(
                  text1: Strings.vehicleNumber,
                  text2: "KL-04-BC-1234",
                ),
                SizedBox(height: media.height * 0.01),
                NormalTextPoppins(
                    text: controller.note, color: Colors.black, fontSize: 15),
                SizedBox(height: media.height * 0.015),
                Container(
                  height: media.height * 0.30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        GoogleMap(
                          onMapCreated: controller.onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: controller.center,
                            zoom: 14.0,
                          ),
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(media.width * 0.02),
                              child: NavigateButton(
                                buttonColor: colorPrimary,
                                textColor: Colors.white,
                                text: Strings.navigate,
                                media: media,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.height * 0.015),
                Column(
                  children: [
                    CancelButton(
                      onTap: () =>
                          controller.showCancelReasonDialog(context, media),
                      media: media,
                      buttonText: Strings.requestForCancellation,
                    ),
                    SizedBox(height: media.height * 0.01),
                    CheckInButton(
                      onTap: () => controller.showConfirmCheckIn(context),
                      media: media,
                      buttonText: Strings.checkIn,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
