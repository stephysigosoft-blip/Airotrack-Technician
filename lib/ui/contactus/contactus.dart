import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: const Text(
          Strings.contactus,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold),
        ),
        leading: SvgPicture.asset('lib/assets/images/back.svg',
            height: 20, width: 20, fit: BoxFit.scaleDown),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              Strings.address,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Poppins-Bold',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "lib/assets/images/mapPinLine.svg",
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Kochi, Kerala",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 25),
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: greylight,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              Strings.emailUsAt,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Poppins-Bold',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "customercare@gmail.com",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Poppins-Bold',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              Strings.callUsAt,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Poppins-Bold',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "+91 1234567890",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Poppins-Bold',
              ),
            )
          ],
        ),
      ),
    );
  }
}
