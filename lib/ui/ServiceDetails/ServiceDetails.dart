import 'package:airotrackgit/Controller/JobDetailsController.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/ServiceDetails/Widgets/ServiceDetailsTextFiedl.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import '../../assets/resources/strings.dart';
import '../CreateNewWork/Widgets/LabelTextWidget.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen(
      {super.key, required this.jobId, required this.amount});
  final String jobId;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(
            title: Strings.serviceDetails, onBack: () => Get.back()),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(media.width * 0.05),
          child: GetBuilder(
            init: JobDetailsController(),
            didChangeDependencies: (state) {
              state.controller?.getServiceDetails(jobId);
            },
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelTextWidget(label: Strings.engineNumber),
                SizedBox(height: media.height * 0.005),
                ServiceDetailsTextField(
                    controller: controller.engineNumberController,
                    hintText: Strings.enterEngineNumber,
                    media: media),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.chassisNumber),
                SizedBox(height: media.height * 0.005),
                ServiceDetailsTextField(
                    controller: controller.chassisNumberController,
                    hintText: Strings.enterChassisNumber,
                    media: media),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.deviceSerialNumber),
                SizedBox(height: media.height * 0.005),
                ServiceDetailsTextField(
                    controller: controller.deviceSerialNumberController,
                    hintText: Strings.enterDeviceSerialNumber,
                    media: media),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.dealerNameForCertificate),
                SizedBox(height: media.height * 0.005),
                ServiceDetailsTextField(
                    controller: controller.dealerNameForCertificateController,
                    hintText: Strings.enterDealerName,
                    media: media),
                controller.vehicleImages.isNotEmpty
                    ? SizedBox(height: media.height * 0.018)
                    : const SizedBox.shrink(),
                controller.vehicleImages.isNotEmpty
                    ? const BoldTextPoppins(
                        text: Strings.vehicleImage,
                        color: Colors.black,
                        fontSize: 15)
                    : const SizedBox.shrink(),
                SizedBox(height: media.height * 0.01),
                Row(
                  children: [
                    controller.vehicleImages.isNotEmpty
                        ? buildImageBox(controller.vehicleImages[0], media)
                        : buildAddImageBox(media),
                  ],
                ),
                SizedBox(height: media.height * 0.01),
                controller.cameraImages.isNotEmpty
                    ? const BoldTextPoppins(
                        text: Strings.cameraView,
                        color: Colors.black,
                        fontSize: 15)
                    : const SizedBox.shrink(),
                SizedBox(height: media.height * 0.01),
                Row(
                  children: [
                    controller.cameraImages.isNotEmpty
                        ? buildImageBox(controller.cameraImages[0], media)
                        : buildAddImageBox(media),
                  ],
                ),
                SizedBox(height: media.height * 0.018),
                CheckInButton(
                  media: media,
                  buttonText: Strings.goToPayment,
                  onTap: () => controller.updateServiceDetails(amount, jobId),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageBox(String imageUrl, Size media) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        APIConfig.Image_URL + imageUrl,
        width: media.width * 0.25,
        height: media.height * 0.12,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildAddImageBox(Size media) {
    return Container(
      width: media.width * 0.25,
      height: media.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: const Icon(Icons.add, size: 30, color: Colors.blue),
    );
  }
}
