import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackSoon extends StatelessWidget {
  const BackSoon({super.key});

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
              'lib/assets/images/maintenance.svg',
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              Strings.backsoon,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins-Bold'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Strings.maintenance,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            ),
            Text(
              Strings.backup,
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
