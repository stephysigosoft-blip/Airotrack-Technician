import 'package:airotrackgit/Controller/CheckInFormController.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/ScanDevices/Widgets/OpenScannerButton.dart';
import 'package:airotrackgit/ui/devices/qrview.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/resources/strings.dart';

class CheckInFormScreen extends StatelessWidget {
  final String jobId;

  const CheckInFormScreen({
    super.key,
    required this.jobId,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: GetBuilder(
        init: CheckInFormController(),
        didChangeDependencies: (state) {
          state.controller?.fetchWorkDetails(jobId);
          if (Get.arguments != null) {
            debugPrint("QR Code: ${Get.arguments}");
            state.controller?.qrCode = Get.arguments;
            state.controller?.update();
          }
        },
        builder: (controller) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
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
                          controller.workDetails?.data?.details?.images
                                          ?.rcImage !=
                                      null ||
                                  controller.pickedRcImage.isNotEmpty
                              ? controller.buildRcImageBox(
                                  media,
                                  APIConfig.Image_URL +
                                      (controller.workDetails?.data?.details
                                              ?.images?.rcImage ??
                                          ""),
                                  controller.pickedRcImage.isNotEmpty)
                              : const SizedBox.shrink(),
                          SizedBox(width: media.width * 0.03),
                          controller.workDetails?.data?.details?.images
                                          ?.rcImage ==
                                      null &&
                                  controller.pickedRcImage.isEmpty
                              ? controller.buildAddRcImageBox(media)
                              : const SizedBox.shrink(),
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
                          controller.workDetails?.data?.details?.images
                                          ?.deviceImage !=
                                      null ||
                                  controller.pickedImage.isNotEmpty
                              ? controller.buildImageBox(
                                  media,
                                  APIConfig.Image_URL +
                                      (controller.workDetails?.data?.details
                                              ?.images?.deviceImage ??
                                          ""),
                                  controller.pickedImage.isNotEmpty)
                              : const SizedBox.shrink(),
                          SizedBox(width: media.width * 0.03),
                          controller.workDetails?.data?.details?.images
                                          ?.deviceImage ==
                                      null &&
                                  controller.pickedImage.isEmpty
                              ? controller.buildAddImageBox(media)
                              : const SizedBox.shrink(),
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
                        onPressed: () async {
                          final result =
                              await Get.to(() => const QRViewExample());
                          if (result != null) {
                            debugPrint('QR Code Result: $result');
                            controller.qrCode.value = result;
                            // Update UI to show the scanned QR code
                          }
                        },
                      ),
                      SizedBox(height: media.height * 0.03),
                      controller.workDetails?.data?.details?.imei.toString() !=
                                  "null" &&
                              controller.workDetails?.data?.details?.productId
                                      .toString() ==
                                  "1"
                          ? Row(
                              children: [
                                const NormalTextPoppins(
                                    text: "IMEI :",
                                    color: Colors.black,
                                    fontSize: 15),
                                SizedBox(width: media.width * 0.03),
                                NormalTextPoppins(
                                    text: controller
                                            .workDetails?.data?.details?.imei
                                            .toString() ??
                                        "",
                                    color: Colors.black,
                                    fontSize: 15),
                              ],
                            )
                          : controller.qrCode.isNotEmpty &&
                                  controller
                                          .workDetails?.data?.details?.productId
                                          .toString() ==
                                      "1"
                              ? Row(
                                  children: [
                                    const NormalTextPoppins(
                                        text: "IMEI :",
                                        color: Colors.black,
                                        fontSize: 15),
                                    SizedBox(width: media.width * 0.03),
                                    Obx(() => NormalTextPoppins(
                                        text: controller.qrCode.value,
                                        color: Colors.black,
                                        fontSize: 15))
                                  ],
                                )
                              : const SizedBox.shrink(),
                      SizedBox(height: media.height * 0.03),
                      const Spacer(),
                      CheckInButton(
                        media: media,
                        buttonText: Strings.checkIn,
                        onTap: () async {
                          await controller.checkIn(jobId: jobId);
                        },
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
