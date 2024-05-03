import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/home/home.dart';
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
      var url = APIConfig.BASE_URL + APIEndpoints.login;
      FormData formData = FormData.fromMap({
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim(),
      });
      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        showToast(response.data['message'].toString());
        saveObject('userData', response.data['data']['details']);
        saveObject('token', response.data['data']['details']['token']);
        Get.to(const Home());
      }
    } catch (error) {
      if (error is DioException) {
        DioException e = error;
        print("Error is c:" + error.response!.data.toString());
        var message;
        var msg = e.response!.data["message"];
        if (msg == null) {
          message = e.response!.data["message"];
          showToast(message);
          //   if (msg == null) {
          //     message = Strings.oopsSomethingWentWrong;
          //     showToast(message);
          //   }
          // } else {
          //   msg = e.response!.data["message"];
          //   if (msg.toString().contains("mobile")) {
          //     message = Strings.mobileNotRegistered;
          //     //  showToast(msg["mobile"]);
          //     mobileErrorText.value = message;
          //     errorFound.value = true;
          //   } else if (msg.toString().contains("blocked")) {
          //     message = Strings.blockedByAdmin;
          //     // showToast(msg["mobile"]);
          //     mobileErrorText.value = message;
          //     errorFound.value = true;
          //   } else {
          //     message = Strings.oopsSomethingWentWrong;
          //     showToast(message);
          //   }
          // }
          // Get.back();
        }
      }
    }
  }
}
