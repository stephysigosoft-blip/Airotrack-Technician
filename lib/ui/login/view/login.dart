import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/ui/devices/devicedetails.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 130,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 20),
            child: const Text(
              Strings.welcome,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 10),
            child: const Text(
              Strings.loginWithUserName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Poppins-Regular'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 35),
            child: const Text(
              Strings.username,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins-Light'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 25,
              top: 15,
              right: 25,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: Strings.enterUserName,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3))),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: const Text(
              Strings.password,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins-Light'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 25,
              top: 15,
              right: 25,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: Strings.enterPassword,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3))),
              ),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          Container(
              height: 55,
              width: width,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: colorPrimary),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DeviceDetail()));
                  },
                  child: const Text(
                    Strings.continueButton,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )))
        ],
      )),
    );
  }
}
