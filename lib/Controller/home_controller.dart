import 'package:airotrackgit/Model/home_model.dart';
import 'package:airotrackgit/config/api_config.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  HomeData? homeData;
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
}
