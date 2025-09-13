import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../assets/resources/colors.dart';
import '../assets/resources/strings.dart';
import '../ui/CheckInForm/CheckInForm.dart';
import '../ui/job_details/Widgets/MultilineTextField.dart';
import '../ui/utils/Widgets/BoldTextPoppins.dart';
import '../ui/utils/Widgets/NormalTextPoppins.dart';
import '../ui/utils/Widgets/YesButtonWidget.dart';

class JobDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("JobDetailsController initialized");
  }

  @override
  void onClose() {
    debugPrint("JobDetailsController disposed");
    super.onClose();
  }

  // the variables should be declared here

  final String note =
      "Note: Lorem ipsum dolor sit amet consectetur adipiscing elit. "
      "Dolor sit amet consectetur adipiscing elit quisque faucibus.";
  late GoogleMapController mapController;
  final LatLng center = const LatLng(9.9312, 76.2673);
  Set<Marker> markers = {};
  bool isLoading = false;
  Dio dio = Dio();

  // No varibales must be declared below this line

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void addMarker(String latitude, String longitude) {
    markers.add(
      Marker(
        markerId: const MarkerId('jobLocation'),
        position: LatLng(double.parse(latitude), double.parse(longitude)),
        infoWindow: const InfoWindow(title: 'Job Location'),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  showConfirmCheckIn(BuildContext context, dynamic jobDetails) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final media = MediaQuery.of(context).size;
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const BoldTextPoppins(
            text: Strings.confirmCheckIn,
            color: Colors.black,
            fontSize: 18,
          ),
          content: const NormalTextPoppins(
            text: Strings.areYouSureYouWantToCheckIn,
            color: Colors.black,
            fontSize: 14,
          ),
          actionsPadding: EdgeInsets.symmetric(
            horizontal: media.width * 0.025,
            vertical: media.height * 0.01,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: media.width * 0.025,
                vertical: media.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  YesButtonWidget(
                      onTap: () => Get.back(),
                      media: media,
                      text: Strings.no,
                      textColor: Colors.black,
                      buttonColor: lightBlue),
                  YesButtonWidget(
                      onTap: () => Get.off(CheckInFormScreen(
                            jobId: jobDetails.id.toString(),
                          )),
                      media: media,
                      text: Strings.yes,
                      textColor: Colors.white,
                      buttonColor: colorPrimary),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showCancelReasonDialog(BuildContext context, Size media) async {
    final TextEditingController reasonController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // blue border
          ),
          contentPadding: EdgeInsets.all(media.height * 0.02),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BoldTextPoppins(
                  text: Strings.reasonForCancellation,
                  color: Colors.black,
                  fontSize: 16),
              SizedBox(height: media.height * 0.01),
              const NormalTextPoppins(
                  text: Strings.pleaseSpecifyTheCancellationReason,
                  color: Colors.black,
                  fontSize: 14),
              SizedBox(height: media.height * 0.02),
              MultiLineTextField(reasonController: reasonController),
              const SizedBox(height: 16),
              CheckInButton(media: media, buttonText: Strings.submitRequest)
            ],
          ),
        );
      },
    );
  }
}
