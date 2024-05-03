import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/resources/colors.dart';
import '../../assets/resources/strings.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorPrimary,
          title: const Text(
            Strings.aboutUs,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Bold',
                fontWeight: FontWeight.bold),
          ),
          leading: SvgPicture.asset('lib/assets/images/back.svg',
              height: 20, width: 20, fit: BoxFit.scaleDown),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.aboutUs,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Bold',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )),
        ));
  }
}
