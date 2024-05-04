import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/devices/devicedetails.dart';
import 'package:airotrackgit/ui/home/home.dart';
import 'package:airotrackgit/ui/utils/no_internet.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class LoginController extends GetxController {
  Dio dio = Dio();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: colorPrimary,
          ));
        });
    try {
      if (await checkNetwork()) {
        var url = APIConfig.BASE_URL + APIEndpoints.login;
        FormData formData = FormData.fromMap({
          'username': usernameController.text.trim(),
          'password': passwordController.text.trim(),
        });
        Response response = await dio.post(url, data: formData);
        print(response.data);
        if (response.statusCode == 200) {
          showFlushBar(response.data['message'].toString());
          saveObject('token', response.data['data']['details']['token']);
          Get.offAll(() => const Home());
        }
      } else {
        Get.to(const NoInternet());
      }
    } catch (error) {
      Get.back();
      if (error is DioException) {
        DioException e = error;
        print("Error is c:" + error.response!.data.toString());
        var message;
        var msg = e.response!.data["message"];
        if (msg == null) {
          message = e.response!.data["message"];
          showFlushBar(message);
          if (msg == null) {
            message = Strings.oopsSomethingWentWrong;
            showFlushBar(message);
          }
        } else {
          msg = e.response!.data["message"];
          if (msg.toString().contains("username")) {
            showFlushBar(msg["username"][0]);
          } else if (msg.toString().contains("password")) {
            showFlushBar(msg["password"][0]);
          } else {
            message = Strings.oopsSomethingWentWrong;
            showFlushBar(message);
          }
        }
      }
    }
  }
}
