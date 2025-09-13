import 'package:airotrackgit/ui/Payment/Payment.dart';
import 'package:airotrackgit/ui/ServiceDetails/Widgets/ServiceDetailsTextFiedl.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../assets/resources/strings.dart';
import '../CreateNewWork/Widgets/LabelTextWidget.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelTextWidget(label: Strings.engineNumber),
              SizedBox(height: media.height * 0.005),
              ServiceDetailsTextField(
                  hintText: Strings.enterEngineNumber, media: media),
              SizedBox(height: media.height * 0.018),
              const LabelTextWidget(label: Strings.chassisNumber),
              SizedBox(height: media.height * 0.005),
              ServiceDetailsTextField(
                  hintText: Strings.enterChassisNumber, media: media),
              SizedBox(height: media.height * 0.018),
              const LabelTextWidget(label: Strings.deviceSerialNumber),
              SizedBox(height: media.height * 0.005),
              ServiceDetailsTextField(
                  hintText: Strings.enterDeviceSerialNumber, media: media),
              SizedBox(height: media.height * 0.018),
              const LabelTextWidget(label: Strings.dealerNameForCertificate),
              SizedBox(height: media.height * 0.005),
              ServiceDetailsTextField(
                  hintText: Strings.enterDealerName, media: media),
              SizedBox(height: media.height * 0.018),
              const BoldTextPoppins(
                  text: Strings.vehicleImage,
                  color: Colors.black,
                  fontSize: 15),
              SizedBox(height: media.height * 0.01),
              Row(
                children: [
                  buildImageBox("lib/assets/images/service_details_dummy.png", media),
                  const SizedBox(width: 8),
                  buildImageBox("lib/assets/images/service_details_dummy.png", media),
                  const SizedBox(width: 8),
                  buildImageBox("lib/assets/images/service_details_dummy.png", media),
                ],
              ),
              SizedBox(height: media.height * 0.01),
              const BoldTextPoppins(
                  text: Strings.cameraView, color: Colors.black, fontSize: 15),
              SizedBox(height: media.height * 0.01),
              Row(
                children: [
                  buildImageBox("lib/assets/images/service_details_dummy.png", media),
                  SizedBox(width: media.width * 0.02),
                  buildAddImageBox(media),
                ],
              ),
              SizedBox(height: media.height * 0.018),
              CheckInButton(
                media: media,
                buttonText: Strings.goToPayment,
                onTap: () => Get.to(() => const PaymentScreen()),
              )
            ],
          ),
        ),
      ),
    );
  }

  




  Widget buildImageBox(String imageUrl, Size media) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imageUrl,
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
