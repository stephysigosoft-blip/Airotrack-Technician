import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/utils/Widgets/BoldTextPoppins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:airotrackgit/Model/MaintenanceModel.dart';
import 'package:airotrackgit/Model/home_model.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/login/view/login.dart';
import 'package:airotrackgit/ui/maintenance/maintenance.dart';
import 'package:airotrackgit/ui/no_internet/no_internet.dart';
import 'package:airotrackgit/ui/server/serverdown.dart';
import 'package:airotrackgit/ui/update/force_update.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../assets/resources/strings.dart';
import '../ui/job_details/job_details.dart';
import '../ui/utils/Widgets/NormalTextPoppins.dart';
import '../ui/utils/Widgets/YesButtonWidget.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getMaintenanceAPI();
    super.onInit();
  }

  // declare all the variable only here
  bool isLoading = true;
  Dio dio = Dio();
  HomeModel? homeData;

  MaintenanceData? settings;

  // No variables should be declared below this line

  getMaintenanceAPI() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String buildNumber = packageInfo.version;
      var url = APIConfig.BASE_URL + APIEndpoints.setting;
      if (await checkNetwork()) {
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          settings = MaintenanceData.fromJson(response.data['data']);
          print(response.data.toString());
          if (settings != null && settings!.maintenance == 1) {
            Get.offAll(() => const MaintenanceScreen());
          } else if (settings!.androidUpdate == 1) {
            if (settings!.androidVersion.toString() != buildNumber) {
              Get.offAll(() => const ForceUpdate());
            } else {
              homeData = await fetchHomeData();
            }
          } else {
            homeData = await fetchHomeData();
          }
        }
      } else {
        Get.to(const NoInternet());
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response?.data['message'] is Map) {
          Map<String, dynamic> message = error.response?.data['message'];
          showErrorToast(message);
        } else if (error.response?.statusCode == 500) {
          Get.offAll(() => const ServerDown());
        } else {
          showFlushBar(error.response?.data['message']);
        }
      } else {
        showFlushBar(error.toString());
      }
    }
  }

  Future<HomeModel?> fetchHomeData() async {
    isLoading = true;
    try {
      var token = await getSavedObject("token");
      debugPrint("Token: $token");
      String url = APIConfig.BASE_URL + APIEndpoints.home;
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(url);
      debugPrint("Response Data: ${response.data}");
      if (response.statusCode == 200) {
        return HomeModel.fromJson(response.data);
      } else {
        throw Exception("Unexpected status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            print("Bad Request: ${e.response?.data}");
            break;
          case 422:
            print("Validation Error: ${e.response?.data}");
            break;
          case 500:
            print("Server Error: ${e.response?.data}");
            break;
          default:
            print(
                "Dio Error: ${e.response?.statusCode} -> ${e.response?.data}");
        }
      } else {
        print("Dio Exception without response: ${e.message}");
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    } finally {
      isLoading = false;
      update();
    }
  }

  logoutAPI() async {
    try {
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                padding: const EdgeInsets.all(10),
                child: const CircularProgressIndicator(),
              ),
            );
          });
      var url = APIConfig.BASE_URL + APIEndpoints.logout;
      var token = getSavedObject('token') ?? "";
      dio.options.headers["Authorization"] = "Bearer $token";
      if (await checkNetwork()) {
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          Get.back();
          showFlushBar(response.data['message']);
          removename('token');
          Get.offAll(() => const Login());
        }
      } else {
        Get.to(const NoInternet());
      }
    } catch (error) {
      Get.back();
      if (error is DioException) {
        if (error.response?.data['message'] is Map) {
          Map<String, dynamic> message = error.response?.data['message'];
          showErrorToast(message);
        } else {
          showFlushBar(error.response?.data['message']);
        }
      } else {
        showFlushBar(error.toString());
      }
    }
  }

  showAcceptJobDialog(BuildContext context) {
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
            text: Strings.acceptJobRequest,
            color: Colors.black,
            fontSize: 18,
          ),
          content: const NormalTextPoppins(
            text: Strings.areYouSureYouWantThisJob,
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
                      onTap: () => Get.off(const JobDetails()),
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

  logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final media = MediaQuery.of(context).size;
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: SvgPicture.asset("lib/assets/images/logout_icon.svg"),
          content: const NormalTextPoppins(
            text: Strings.areYouSureYouWantToLogout,
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
                children: [
                  YesButtonWidget(
                      onTap: () => Get.back(),
                      media: media,
                      text: Strings.no,
                      textColor: Colors.black,
                      buttonColor: lightBlue),
                  SizedBox(width: media.width * 0.03),
                  YesButtonWidget(
                      onTap: () => logoutAPI(),
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
}
