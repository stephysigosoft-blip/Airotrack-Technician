import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

class HomeController extends GetxController {
  bool isLoading = true;
  HomeData? homeData;
  Dio dio = Dio();

  MaintenanceData? settings;
  @override
  void onInit() {
    getMaintenanceAPI();
    super.onInit();
  }

  getMaintenanceAPI() async {
    try {
      var url = APIConfig.BASE_URL + APIEndpoints.setting;
      if (await checkNetwork()) {
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          settings = MaintenanceData.fromJson(response.data['data']);
          if (settings != null && settings!.maintenance == 1) {
            Get.offAll(() => const MaintenanceScreen());
          } else if (settings!.androidUpdate == 1) {
            Get.offAll(() => const ForceUpdate());
          } else {
            getHome();
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

  getHome() async {
    try {
      isLoading = true;
      update();
      var url = APIConfig.BASE_URL + APIEndpoints.home;
      var token = getSavedObject('token') ?? "";
      dio.options.headers["Authorization"] = "Bearer $token";
      if (await checkNetwork()) {
        var response = await dio.get(url);
        if (response.statusCode == 200) {
          homeData = HomeData.fromJson(response.data['data']);
          update();
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
}
