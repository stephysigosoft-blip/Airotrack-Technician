import 'package:airotrackgit/Controller/CheckInFormController.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/ScanDevices/Widgets/OpenScannerButton.dart';
import 'package:airotrackgit/ui/ServiceDetails/ServiceDetails.dart';
import 'package:airotrackgit/ui/devices/qrview.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/resources/strings.dart';

class CheckInFormScreen extends StatelessWidget {
  const CheckInFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: GetBuilder(
        init: CheckInFormController(),
        builder: (controller) => Scaffold(
          appBar: CustomAppBar(
              title: Strings.checkInForm, onBack: () => Get.back()),
          body: Padding(
            padding: EdgeInsets.all(media.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BoldTextPoppins(
                    text: Strings.registrationCertificate,
                    color: Colors.black,
                    fontSize: 15),
                SizedBox(height: media.height * 0.01),
                Row(
                  children: [
                    controller.buildImageBox(
                      media,
                      "lib/assets/images/dummy_liscense_image.png", // sample uploaded image
                    ),
                    SizedBox(width: media.width * 0.03),
                    controller.buildAddImageBox(media),
                  ],
                ),
                SizedBox(height: media.height * 0.03),
                const BoldTextPoppins(
                    text: Strings.devicePhoto,
                    color: Colors.black,
                    fontSize: 15),
                const SizedBox(height: 8),
                Row(
                  children: [
                    controller.buildImageBox(
                      media,
                      "lib/assets/images/dummy_device_image.png", // sample uploaded image
                    ),
                    SizedBox(width: media.width * 0.03),
                    controller.buildAddImageBox(media),
                  ],
                ),
                SizedBox(height: media.height * 0.03),
                const BoldTextPoppins(
                    text: Strings.scanDevice,
                    color: Colors.black,
                    fontSize: 15),
                SizedBox(height: media.height * 0.01),
                OpenScannerButton(
                  media: media,
                  buttonColor: colorPrimary,
                  onPressed: () => Get.to(const QRViewExample()),
                ),
                const Spacer(),
                CheckInButton(
                  media: media,
                  buttonText: Strings.checkIn,
                  onTap: () => Get.to(const ServiceDetailsScreen()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
