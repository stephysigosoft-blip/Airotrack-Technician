import 'package:airotrackgit/Model/work_details_model.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/Payment/Payment.dart';
import 'package:airotrackgit/ui/home/homeNew.dart';
import 'package:airotrackgit/ui/utils/Functions/network_testing.dart';
import 'package:airotrackgit/ui/utils/Functions/on_dio_exception.dart';
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
  WorkDetailsModel? workDetails;
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController techniciansNoteController =
      TextEditingController();
  final TextEditingController engineNumberController = TextEditingController();
  final TextEditingController chassisNumberController = TextEditingController();
  final TextEditingController deviceSerialNumberController =
      TextEditingController();
  final TextEditingController dealerNameForCertificateController =
      TextEditingController();
  List<String> vehicleImages = [];
  List<String> cameraImages = [];
  String qrCode = "";
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

  List<String> _convertToStringList(dynamic value) {
    if (value == null) return [];
    if (value is List) {
      return value.map((e) => e.toString()).toList();
    }
    return [value.toString()];
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

  Future<void> showCancelReasonDialog(
      BuildContext context, Size media, String jobId) async {
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
              CheckInButton(
                  onTap: () => reasonController.text.isEmpty
                      ? showToast("Please enter a reason for cancellation")
                      : requestCancelling(jobId.toString()),
                  media: media,
                  buttonText: Strings.submitRequest)
            ],
          ),
        );
      },
    );
  }

  Future<void> requestCancelling(String id) async {
    isLoading = true;
    checkNetworkAndRedirectOffAll();
    try {
      var token = await getSavedObject("token");
      debugPrint("Token: $token");
      String url = APIConfig.BASE_URL + APIEndpoints.requestCancelling;
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.queryParameters = {
        "job_id": id,
        "cancellation_reason": reasonController.text
      };
      debugPrint("URL: $url");
      debugPrint("Query Parameters: ${dio.options.queryParameters}");
      final response = await dio.get(url);
      debugPrint("Response Data: ${response.data}");
      if (response.statusCode == 200) {
        Get.offAll(() => const HomeNew());
      } else {
        throw Exception("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        handleDioException(e);
      } else {
        debugPrint("Dio Exception without response: ${e.message}");
      }
    } catch (e) {
      debugPrint("Unexpected Error: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getServiceDetails(String id) async {
    isLoading = true;
    checkNetworkAndRedirectOffAll();
    try {
      var token = await getSavedObject("token");
      debugPrint("Token: $token");
      String url = APIConfig.BASE_URL + APIEndpoints.workDetails;
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.queryParameters = {
        "job_id": id,
      };
      debugPrint("URL: $url");
      debugPrint("Query Parameters: ${dio.options.queryParameters}");
      final response = await dio.get(url);
      debugPrint("Response Data: ${response.data}");
      if (response.statusCode == 200) {
        workDetails = WorkDetailsModel.fromJson(response.data);
        engineNumberController.text =
            workDetails?.data?.details?.engineNo ?? "";
        chassisNumberController.text =
            workDetails?.data?.details?.chassisNo ?? "";
        deviceSerialNumberController.text =
            workDetails?.data?.details?.deviceSerialNo ?? "";
        vehicleImages = _convertToStringList(
            workDetails?.data?.details?.images?.vehicleImage);
        cameraImages = _convertToStringList(
            workDetails?.data?.details?.images?.capturedImage);
        update();
      } else {
        throw Exception("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        handleDioException(e);
      } else {
        debugPrint("Dio Exception without response: ${e.message}");
      }
    } catch (e) {
      debugPrint("Unexpected Error: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> updateServiceDetails(double amount, String jobId) async {
    if (engineNumberController.text.isEmpty) {
      showToast("Please enter the engine number");
      return;
    } else if (chassisNumberController.text.isEmpty) {
      showToast("Please enter the chassis number");
      return;
    } else if (deviceSerialNumberController.text.isEmpty) {
      showToast("Please enter the device serial number");
      return;
    } else if (dealerNameForCertificateController.text.isEmpty) {
      showToast("Please enter the dealer name for certificate");
      return;
    } else if (vehicleImages.isEmpty) {
      showToast("Please add the vehicle image");
      return;
    } else if (cameraImages.isEmpty) {
      showToast("Please add the camera image");
      return;
    } else {
      Get.to(() => PaymentScreen(amount: amount, jobId: jobId));
    }
  }

 
}
