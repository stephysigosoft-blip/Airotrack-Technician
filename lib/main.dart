import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'ui/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Airotack',
        theme: ThemeData(
          fontFamily: "Poppins",
          colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary),
          useMaterial3: true,
        ),
        home: Splash()
        //  const DeviceDetail(
        //   deviceId: '860560069759803',
        //   // deviceId: '866334071989376',
        //   // deviceId: '860560069023234',
        // ),
        );
  }
}
