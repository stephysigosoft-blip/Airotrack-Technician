import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:airotrackgit/Model/home_model.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/login/view/login.dart';
import 'package:airotrackgit/ui/utils/utils.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  HomeData? homeData;
  Dio dio = Dio();
  @override
  void onInit() {
    getHome();
    super.onInit();
  }

  getMaintenanceAPI() async {
    try {
      isLoading = true;
      update();
      var url = APIConfig.BASE_URL + APIEndpoints.setting;
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        // homeData = HomeData.fromJson(response.data['data']);
        update();
      }
    } catch (error) {
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
    } finally {
      isLoading = false;
      update();
    }
  }

  getHome() async {
    try {
      isLoading = true;
      update();
      var url = APIConfig.BASE_URL + APIEndpoints.home;
      var token = getSavedObject('token') ?? "";
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        homeData = HomeData.fromJson(response.data['data']);
        update();
      }
    } catch (error) {
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
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        Get.back();
        showFlushBar(response.data['message']);
        removename('token');
        Get.offAll(() => const Login());
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
