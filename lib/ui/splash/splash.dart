import 'dart:async';

import 'package:airotrackgit/ui/devices/devicedetails.dart';
import 'package:airotrackgit/ui/login/view/login.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/ui/home/home.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    loginCheck();
    super.initState();
  }

  loginCheck() async {
    var token = await getSavedObject("token");
    if (token != null) {
      Timer(const Duration(seconds: 3), () => Get.offAll( DeviceDetail(imei: '',)));
    } else {
      Get.offAll(const Home());
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * 3.5 / 4,
              child: SvgPicture.asset(
                'lib/assets/images/logosplash.svg',
              ),
            ),
            Container(
                height: 50,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: colorPrimary),
                    onPressed: () {
                      var token = getSavedObject('token');
                      // if (token == null || token.isEmpty) {
                      //   Get.offAll(() => const Login());
                      // } else {
                      Get.offAll(() => const Home());
                      // }
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const Home()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.getStart,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
