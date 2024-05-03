import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SvgPicture.asset(
            'lib/assets/images/logosplash.svg',
            height: 60,
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 50,
              ),
              const DrawerHeader(
                // decoration: BoxDecoration(
                // ),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                    )),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'lib/assets/images/contactus.svg',
                  width: 20,
                  height: 20,
                ),
                trailing: SvgPicture.asset(
                  'lib/assets/images/arrow.svg',
                  width: 15,
                  height: 15,
                ),
                title: const Text(Strings.contactus),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 35, top: 20),
                height: 1,
                color: greyline,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'lib/assets/images/privacy.svg',
                  width: 20,
                  height: 20,
                ),
                trailing: SvgPicture.asset(
                  'lib/assets/images/arrow.svg',
                  width: 15,
                  height: 15,
                ),
                title: const Text(Strings.privacyPolicy),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 35, top: 20),
                height: 1,
                color: greyline,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'lib/assets/images/aboutus.svg',
                  width: 20,
                  height: 20,
                ),
                trailing: SvgPicture.asset(
                  'lib/assets/images/arrow.svg',
                  width: 15,
                  height: 15,
                ),
                title: const Text(Strings.aboutUs),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 35, top: 20),
                height: 1,
                color: greyline,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'lib/assets/images/terms.svg',
                  width: 20,
                  height: 20,
                ),
                title: const Text(Strings.terms),
                trailing: SvgPicture.asset(
                  'lib/assets/images/arrow.svg',
                  width: 15,
                  height: 15,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 35, top: 20),
                height: 1,
                color: greyline,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'lib/assets/images/logout.svg',
                  width: 20,
                  height: 20,
                ),
                trailing: SvgPicture.asset(
                  'lib/assets/images/arrowred.svg',
                  width: 15,
                  height: 15,
                ),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    border: Border.all(color: colorPrimary),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15, top: 25),
                          child: Text(
                            Strings.welcome,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins-Regular'),
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            "Jobin",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins-Bold'),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'lib/assets/images/calendar.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "05 Jun 2023",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      fontSize: 15,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'lib/assets/images/schedulewhite.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "8:22:11 AM",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Text(
                Strings.scanDevice,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins-Bold'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: () async {
                  var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "lib/assets/images/barwhite.svg",
                      width: 27,
                      height: 27,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      Strings.openScanner,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Poppins-Bold',
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Text(
                Strings.deviceID,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins-Bold'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 15),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Material(
                      elevation: 2.0,
                      color: colorPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    fillColor: greybg,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blacklite, width: 1.0),
                        borderRadius: BorderRadius.circular(4)),
                    hintText: "Enter Device ID",
                    hintStyle: TextStyle(color: blacklite)),
              ),
            )
          ],
        ));
  }
}
