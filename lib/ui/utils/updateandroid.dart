import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/resources/colors.dart';

class UpdateAndroid extends StatelessWidget {
  const UpdateAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 200,
              child: SvgPicture.asset(
                'lib/assets/images/logosplash.svg',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.updateMsg,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins-Bold'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Strings.updateAvailable,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            ),
            Text(
              Strings.downloadLatest,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            ),
            Text(
              Strings.continueApp,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            ),
            SizedBox(
              height: 130,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: colorPrimary),
                    onPressed: () {},
                    child: Text(
                      Strings.update,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )),
            SizedBox(
              height: 140,
            ),
            SizedBox(
              child: Image.asset(
                'lib/assets/images/playstore1.png',
              ),
            ),
          ],
        ),
      )),
    );
  }
}
