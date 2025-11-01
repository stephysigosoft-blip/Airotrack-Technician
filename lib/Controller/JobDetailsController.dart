import 'dart:io';
import 'package:airotrackgit/Model/speed_governor_model.dart';
import 'package:airotrackgit/Model/work_details_model.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/Payment/Payment.dart';
import 'package:airotrackgit/ui/home/homeNew.dart';
import 'package:airotrackgit/ui/utils/Functions/network_testing.dart';
import 'package:airotrackgit/ui/utils/Functions/on_dio_exception.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../assets/resources/colors.dart';
import '../assets/resources/strings.dart';
import '../ui/CheckInForm/CheckInForm.dart';
import '../ui/CheckInForm/widgets/choose_image_widget.dart';
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
  final TextEditingController cameraNameController = TextEditingController();
  final TextEditingController imeiController = TextEditingController();
  final TextEditingController speedGovernorIdController =
      TextEditingController();
  List<String> vehicleImages = [];
  List<String> cameraImages = [];
  String qrCode = "";
  ImagePicker imagePicker = ImagePicker();
  XFile? selectedVehicleImage;
  XFile? selectedCameraImage;
  PermissionStatus? cameraStatus;
  PermissionStatus? photosStatus;
  String pickedVehicleImage = "";
  String pickedCameraImage = "";
  String productId = "";
  SpeedGovernorModel? speedGovernorDetails;
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

  showConfirmCheckIn(BuildContext context, dynamic jobDetails, dynamic ongoingWorks) {
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
                        ongoingWorks: ongoingWorks,
                            jobId: jobDetails.id.toString(),
                            productId: jobDetails.productId.toString(),
                            serviceType: jobDetails.serviceType.toString(),
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
        imeiController.text = workDetails?.data?.details?.imei ?? "";
        productId = workDetails?.data?.details?.productId.toString() ?? "";
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

  Future<void> openCameraForVehicle() async {
    try {
      cameraStatus = await Permission.camera.request();
      if (cameraStatus == PermissionStatus.granted) {
        final XFile? image = await imagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 80,
          preferredCameraDevice: CameraDevice.rear,
        );
        if (image != null) {
          selectedVehicleImage = image;
          debugPrint("Vehicle Image captured from camera: ${image.path}");
          Get.back(); // Close dialog
          pickedVehicleImage = image.path;
          if (vehicleImages.isEmpty) {
            vehicleImages.add(image.path);
          } else {
            vehicleImages[0] = image.path;
          }
          update();
        }
      } else {
        showToast("Camera permission is required to capture photos");
      }
    } catch (e) {
      debugPrint("Error capturing vehicle image: $e");
      showToast("Failed to open camera: ${e.toString()}");
    }
  }

  Future<void> openGalleryForVehicle() async {
    try {
      Permission permission = Permission.photos;
      photosStatus = await permission.request();
      if (photosStatus == PermissionStatus.granted) {
        final XFile? image = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
        );
        if (image != null) {
          selectedVehicleImage = image;
          debugPrint("Vehicle Image selected from gallery: ${image.path}");
          Get.back();
          pickedVehicleImage = image.path;
          if (vehicleImages.isEmpty) {
            vehicleImages.add(image.path);
          } else {
            vehicleImages[0] = image.path;
          }
          update();
        }
      } else {
        showToast("Permission is required to access photos from gallery");
      }
    } catch (e) {
      debugPrint("Error selecting vehicle image: $e");
      showToast("Failed to open gallery: ${e.toString()}");
    }
  }

  Future<void> openCameraForCamera() async {
    try {
      cameraStatus = await Permission.camera.request();
      if (cameraStatus == PermissionStatus.granted) {
        final XFile? image = await imagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 80,
          preferredCameraDevice: CameraDevice.rear,
        );
        if (image != null) {
          selectedCameraImage = image;
          debugPrint("Camera Image captured from camera: ${image.path}");
          Get.back(); // Close dialog
          pickedCameraImage = image.path;
          if (cameraImages.isEmpty) {
            cameraImages.add(image.path);
          } else {
            cameraImages[0] = image.path;
          }
          update();
        }
      } else {
        showToast("Camera permission is required to capture photos");
      }
    } catch (e) {
      debugPrint("Error capturing camera image: $e");
      showToast("Failed to open camera: ${e.toString()}");
    }
  }

  Future<void> openGalleryForCamera() async {
    try {
      Permission permission = Permission.photos;
      photosStatus = await permission.request();
      if (photosStatus == PermissionStatus.granted) {
        final XFile? image = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
        );
        if (image != null) {
          selectedCameraImage = image;
          debugPrint("Camera Image selected from gallery: ${image.path}");
          Get.back();
          pickedCameraImage = image.path;
          if (cameraImages.isEmpty) {
            cameraImages.add(image.path);
          } else {
            cameraImages[0] = image.path;
          }
          update();
        }
      } else {
        showToast("Permission is required to access photos from gallery");
      }
    } catch (e) {
      debugPrint("Error selecting camera image: $e");
      showToast("Failed to open gallery: ${e.toString()}");
    }
  }

  void showVehicleImageOptions(BuildContext context) {
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
            text: Strings.chooseImage,
            color: Colors.black,
            fontSize: 18,
          ),
          actionsPadding: EdgeInsets.symmetric(
            horizontal: media.width * 0.025,
            vertical: media.height * 0.01,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: media.width * 0.020,
                vertical: media.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChooseImageWidget(
                      onTap: () {
                        openCameraForVehicle();
                      },
                      media: media,
                      icon: Icons.camera_alt,
                      text: Strings.camera),
                  ChooseImageWidget(
                      onTap: () {
                        openGalleryForVehicle();
                      },
                      media: media,
                      icon: Icons.photo_library,
                      text: Strings.gallery),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void showCameraImageOptions(BuildContext context) {
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
            text: Strings.chooseImage,
            color: Colors.black,
            fontSize: 18,
          ),
          actionsPadding: EdgeInsets.symmetric(
            horizontal: media.width * 0.025,
            vertical: media.height * 0.01,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: media.width * 0.020,
                vertical: media.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChooseImageWidget(
                      onTap: () {
                        openCameraForCamera();
                      },
                      media: media,
                      icon: Icons.camera_alt,
                      text: Strings.camera),
                  ChooseImageWidget(
                      onTap: () {
                        openGalleryForCamera();
                      },
                      media: media,
                      icon: Icons.photo_library,
                      text: Strings.gallery),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildAddImageBox(Size media, bool isVehicleImage) {
    return InkWell(
      onTap: () => isVehicleImage
          ? showVehicleImageOptions(Get.context!)
          : showCameraImageOptions(Get.context!),
      child: Container(
        width: media.width * 0.25,
        height: media.height * 0.12,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: const Icon(Icons.add, size: 30, color: Colors.blue),
      ),
    );
  }

  Widget buildImageBox(
      String imageUrl, Size media, bool isPicked, bool isVehicleImage) {
    final imagePath = isVehicleImage ? pickedVehicleImage : pickedCameraImage;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: isPicked && imagePath.isNotEmpty
          ? Image.file(
              File(imagePath),
              width: media.width * 0.25,
              height: media.height * 0.12,
              fit: BoxFit.cover,
            )
          : CachedNetworkImage(
              imageUrl: APIConfig.Image_URL + imageUrl,
              width: media.width * 0.25,
              height: media.height * 0.12,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: media.width * 0.1,
                  height: media.height * 0.05,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_not_supported,
                color: colorPrimary,
                size: 40,
              ),
            ),
    );
  }

  Future<void> postCheckout(
      String id,
      String latitude,
      String longitude,
      String engineNo,
      String chassisNo,
      String deviceSerialNo,
      String vehicleImage,
      String capturedImage,
      String cameraName,
      String imei,
      String speedGovernorId) async {
    isLoading = true;
    checkNetworkAndRedirectOffAll();
    try {
      var token = await getSavedObject("token");
      debugPrint("Token: $token");
      String url = APIConfig.BASE_URL + APIEndpoints.checkout;
      dio.options.headers["Authorization"] = "Bearer $token";
      debugPrint("URL: $url");
      String fileNameFromPath(String path) {
        if (path.isEmpty) return "";
        var normalized = path.replaceAll('\\\\', '/');
        var parts = normalized.split('/');
        return parts.isNotEmpty ? parts.last : "";
      }

      Map<String, dynamic> formMap = {
        "job_id": id,
        "latitude": latitude,
        "longitude": longitude,
        "engine_no": engineNo,
        "chassis_no": chassisNo,
        "device_serial_no": deviceSerialNo,
        "camera_name": cameraName,
        "imei": imei,
        "speed_governor_id": speedGovernorId,
      };

      Future<MultipartFile?> toMultipart(String value) async {
        try {
          if (value.isEmpty) return null;
          final String normalized = value.startsWith('file://')
              ? value.replaceFirst('file://', '')
              : value;
          final bool existsLocally = File(normalized).existsSync();
          if (existsLocally) {
            return await MultipartFile.fromFile(normalized,
                filename: fileNameFromPath(normalized));
          }
          // Treat as remote/server path. Build full URL if it's relative.
          final bool isAbsoluteUrl = normalized.startsWith('http://') ||
              normalized.startsWith('https://');
          final String fullUrl =
              isAbsoluteUrl ? normalized : (APIConfig.Image_URL + normalized);
          // Download bytes to temp file and wrap as MultipartFile
          final tmpDir = Directory.systemTemp;
          final String fileName = fileNameFromPath(normalized).isNotEmpty
              ? fileNameFromPath(normalized)
              : 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
          final String tmpPath = '${tmpDir.path}/$fileName';
          final imgResp = await dio.get<List<int>>(fullUrl,
              options: Options(responseType: ResponseType.bytes));
          await File(tmpPath).writeAsBytes(imgResp.data ?? <int>[]);
          return await MultipartFile.fromFile(tmpPath, filename: fileName);
        } catch (_) {
          return null;
        }
      }

      if (vehicleImage.isNotEmpty) {
        final multipart = await toMultipart(vehicleImage);
        if (multipart != null) {
          formMap["vehicle_image"] = multipart;
        }
      }
      if (capturedImage.isNotEmpty) {
        final multipart = await toMultipart(capturedImage);
        if (multipart != null) {
          formMap["captured_image"] = multipart;
        }
      }
      debugPrint("Form Map: $formMap");
      FormData data = FormData.fromMap(formMap);
      final response = await dio.post(url, data: data);
      debugPrint("Response Data: ${response.data}");
      debugPrint("Response Status Code: ${response.statusCode}");
      if (response.statusCode == 200) {
        final amount = workDetails?.data?.details?.totalAmount;
        double paymentAmount = 0.0;
        if (amount != null) {
          if (amount is num) {
            paymentAmount = (amount as num).toDouble();
          } else {
            paymentAmount = double.tryParse(amount.toString()) ?? 0.0;
          }
        }
        Get.offAll(() => PaymentScreen(
              amount: paymentAmount,
              jobId: id,
            ));
      } else {
        throw Exception("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        handleDioException(e);
      } else {
        debugPrint("Dio Exception without response: ${e.message}");
      }
    } catch (e, stackTrace) {
      debugPrint("Unexpected Error: $e");
      debugPrint("Stack Trace: $stackTrace");
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
    } else if (((productId.toString() == "2" || productId.toString() == "3")) &&
        deviceSerialNumberController.text.isEmpty) {
      showToast("Please enter the device serial number");
      debugPrint("productId: $productId");
      return;
    } else if (productId.toString() == "2" &&
        cameraNameController.text.isEmpty) {
      showToast("Please enter the camera name");
      return;
    } else if (productId.toString() == "3" &&
        speedGovernorIdController.text.isEmpty) {
      showToast("Please enter the speed governor id");
      return;
    } else if (vehicleImages.isEmpty && pickedVehicleImage.isEmpty) {
      showToast("Please add the vehicle image");
      debugPrint("Vehicle Images: $vehicleImages, Picked: $pickedVehicleImage");
      return;
    } else if ((productId.toString() == "2") &&
        cameraImages.isEmpty &&
        pickedCameraImage.isEmpty) {
      showToast("Please add the camera image");
      debugPrint("Camera Images: $cameraImages, Picked: $pickedCameraImage");
      return;
    } else {
      final vehicleImage = pickedVehicleImage.isNotEmpty
          ? pickedVehicleImage
          : (vehicleImages.isNotEmpty ? vehicleImages[0] : "");
      final cameraImage = pickedCameraImage.isNotEmpty
          ? pickedCameraImage
          : (cameraImages.isNotEmpty ? cameraImages[0] : "");

      postCheckout(
          jobId,
          workDetails?.data?.details?.latitude ?? "",
          workDetails?.data?.details?.longitude ?? "",
          engineNumberController.text,
          chassisNumberController.text,
          deviceSerialNumberController.text,
          vehicleImage,
          cameraImage,
          cameraNameController.text,
          imeiController.text,
          speedGovernorIdController.text);
    }
  }

  Future<void> getSpeedGovernorDetails() async {
    isLoading = true;
    checkNetworkAndRedirectOffAll();
    try {
      var token = await getSavedObject("token");
      debugPrint("Token: $token");
      String url = APIConfig.BASE_URL + APIEndpoints.getSpeedGovernorData;
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.queryParameters = {};
      debugPrint("URL: $url");
      debugPrint("Query Parameters: ${dio.options.queryParameters}");
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        debugPrint("Response received, parsing speed governors in isolate...");
        final responseData = response.data;
        speedGovernorDetails =
            await compute(_parseSpeedGovernorModel, responseData);
        debugPrint(
            "Parsing completed in isolate. Speed governors loaded: ${speedGovernorDetails?.data?.speedGovernors?.length ?? 0}");
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
}

SpeedGovernorModel _parseSpeedGovernorModel(dynamic jsonData) {
  return SpeedGovernorModel.fromJson(jsonData as Map<String, dynamic>?);
}
