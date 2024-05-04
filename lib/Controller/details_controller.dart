import 'package:airotrackgit/Model/Commandamodel.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

class DetailsController extends GetxController {
  bool isLoading = false;
  Dio dio = Dio();
  List<Command> commands = [];

  sendCommands(String imei, String commandId) async {
    try {
      isLoading = true;
      update();
      var token = getSavedObject('token') ?? "";
      var url = APIConfig.BASE_URL + APIEndpoints.sendCommand;
      FormData data = FormData.fromMap({"imei": imei, "command_id": commandId});
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(url);
      if (response.statusCode == 200) {}
    } catch (error) {
      isLoading = false;
      if (error is DioException) {
        print(error.response?.data);
      } else {
        print(error.toString());
      }
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
