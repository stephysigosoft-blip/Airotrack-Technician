import 'package:airotrackgit/Model/details_details.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

class DetailsController extends GetxController {
  bool isLoading = false;
  Dio dio = Dio();
  List<Command> commands = [];
  DeviceDetails? deviceDetails;

  getDeatils(
    String imei,
  ) async {
    try {
      isLoading = true;
      update();
      var token = getSavedObject('token') ?? "";
      var url = APIConfig.BASE_URL + APIEndpoints.deviceDetails;

      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(url, queryParameters: {
        "imei": imei,
      });
      if (response.statusCode == 200) {
        deviceDetails =
            DeviceDetails.fromJson(response.data['data']['device_details']);
        response.data['data']['commands']
            .map((e) => commands.add(Command.fromJson(e)))
            .toList();
        update();
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response?.data['message'] is Map) {
          Map<String, dynamic> message = error.response?.data['message'];
          showErrorToast(message);
        } else {
          showToast(error.response?.data['message']);
        }
      } else {
        showToast(error.toString());
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  getDeatilsWithId(
    String id,
  ) async {
    try {
      isLoading = true;
      update();
      var token = getSavedObject('token') ?? "";
      var url = APIConfig.BASE_URL + APIEndpoints.deviceDetailswithId;
      dio.options.headers["Authorization"] = "Bearer $token";
      print(id);
      var response = await dio.get(url, queryParameters: {
        "device_id": id,
      });
      if (response.statusCode == 200) {
        print(response.data);
        deviceDetails =
            DeviceDetails.fromJson(response.data['data']['device_details']);
        response.data['data']['commands']
            .map((e) => commands.add(Command.fromJson(e)))
            .toList();
        update();
      }
    } catch (error) {
      if (error is DioException) {
        print(error.response?.data);
        if (error.response?.data['message'] is Map) {
          Map<String, dynamic> message = error.response?.data['message'];
          showErrorToast(message);
        } else {
          showToast(error.response?.data['message']);
        }
      } else {
        showToast(error.toString());
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  sendCommands(String imei, String commandId) async {
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
      var token = getSavedObject('token') ?? "";
      var url = APIConfig.BASE_URL + APIEndpoints.sendCommand;
      FormData data = FormData.fromMap({"imei": imei, "command_id": commandId});
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        showToast(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response?.data['message'] is Map) {
          Map<String, dynamic> message = error.response?.data['message'];
          showErrorToast(message);
        } else {
          showToast(error.response?.data['message']);
        }
      } else {
        showToast(error.toString());
      }
    } finally {
      Get.back();
    }
  }

  // Future<void> getCommands(String modelName) async {
  //   try {
  //     isLoading = true;
  //     var token = getSavedObject('token') ?? "";
  //     var url = APIConfig.BASE_URL + APIEndpoints.command;
  //     dio.options.headers["Authorization"] = "Bearer $token";
  //     print(url);
  //     FormData body = FormData.fromMap({
  //       "model_name": modelName,
  //     });
  //     var response = await dio.get(url, data: body);
  //     print(response.data);
  //     if (response.statusCode == 200) {
  //       response.data['data']['commands']
  //           .map((e) => commands.add(Command.fromJson(e)))
  //           .toList();
  //       isLoading = false;
  //       update();
  //     }
  //   } catch (e) {
  //     if (e is DioException) {
  //       print(e.response!.data);
  //       // Map<String, dynamic> message = e.response?.data['message'];
  //       // showErrorToast(message);
  //     } else {
  //       showToast(e.toString());
  //     }
  //   }
  // }
}
