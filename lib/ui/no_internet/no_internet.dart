import 'dart:async';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/ui/splash/splash.dart';
import 'package:airotrackgit/ui/utils/Functions/network_testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  Timer? _networkCheckTimer;

  @override
  void initState() {
    super.initState();
    checkNetwork();
    _networkCheckTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkNetwork();
    });
  }

  @override
  void dispose() {
    _networkCheckTimer?.cancel();
    super.dispose();
  }

  checkNetwork() async {
    if (await isNetworkAvailable()) {
      _networkCheckTimer?.cancel();
      Get.offAll(() => const Splash());
    } else {
      debugPrint("No internet");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/assets/images/nointernet.svg',
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              Strings.noIntenet,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins-Bold'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              Strings.checkInternet,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            ),
            const Text(
              Strings.again,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            )
          ],
        ),
      ),
    );
  }
}
