import 'package:airotrackgit/Model/Commandamodel.dart';
import 'package:airotrackgit/Model/details_details.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

class DetailsController extends GetxController {
  bool isLoading = false;
  Dio dio = Dio();
  List<Command> commands = [];
  DeviceDetails? deviceDetails;

  @override
  void onInit() {
    super.onInit();
    getCommands();
  }

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
        print(response.data);
        deviceDetails =
            DeviceDetails.fromJson(response.data['data']['device_details']);
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

  sendCommands(String imei, String commandId) async {
    try {
      isLoading = true;
      update();
      var token = getSavedObject('token') ?? "";
      var url = APIConfig.BASE_URL + APIEndpoints.sendCommand;
      FormData data = FormData.fromMap({"imei": imei, "command_id": commandId});
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.post(url, data: data);
      if (response.statusCode == 200) {}
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

  Future<void> getCommands(String modelName) async {
    try {
      isLoading = true;
      var token = getSavedObject('token') ?? "";
      var url = APIConfig.BASE_URL + APIEndpoints.command;
      dio.options.headers["Authorization"] = "Bearer $token";
      print(url);
      FormData body = FormData.fromMap({
        "model_name": modelName,
      });
      var response = await dio.get(url, data: body);
      print(response.data);
      if (response.statusCode == 200) {
        response.data['data']['commands']
            .map((e) => commands.add(Command.fromJson(e)))
            .toList();
        isLoading = false;
        update();
      }
    } catch (e) {
      if (e is DioException) {
        print(e.response!.data);
        // Map<String, dynamic> message = e.response?.data['message'];
        // showErrorToast(message);
      } else {
        showToast(e.toString());
      }
    }
  }
}
