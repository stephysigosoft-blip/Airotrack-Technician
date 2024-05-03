import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/resources/strings.dart';


class ServerDown extends StatelessWidget {
  const ServerDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('lib/assets/images/serverdown.svg',
              fit: BoxFit.scaleDown,),
            SizedBox(
              height: 30,
            ),
            Text(Strings.serverDown,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins-Bold'
              ),),

          ],
        ),
      ),
    );
  }
}
