import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

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
            SizedBox(
              height: 30,
            ),
            Text(
              Strings.noIntenet,
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
              Strings.checkInternet,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            ),
            Text(
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
