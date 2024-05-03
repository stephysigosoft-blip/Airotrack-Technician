import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

class DetailsController extends GetxController {
  bool isLoading = false;

  sendCommands(String imei, String commandId) async {
    try {
      isLoading = true;
      update();
      var token = getSavedObject('token') ?? "";
      var url = APIConfig.BASE_URL + APIEndpoints.sendCommand;
      FormData data = FormData.fromMap({"imei": imei, "command_id": commandId});
      Dio dio = Dio();
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
}
