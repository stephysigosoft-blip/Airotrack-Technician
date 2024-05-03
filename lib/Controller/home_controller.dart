import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  @override
  void onInit() {
    getHome();
    super.onInit();
  }

  getHome() async {
    try {
      isLoading = true;
      update();
      var url = APIConfig.BASE_URL + APIEndpoints.home;
      var token = getSavedObject('token') ?? "";
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(url);
      if (response.statusCode == 200) {}
    } catch (error) {
      isLoading = false;
      update();
      if (error is DioException) {
        print(error.response?.data);
      } else {
        print(error.toString());
      }
    }
  }
}
