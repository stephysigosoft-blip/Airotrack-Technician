import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeviceDetail extends StatefulWidget {
  const DeviceDetail({super.key});

  @override
  State<DeviceDetail> createState() => _DeviceDetailState();
}

class _DeviceDetailState extends State<DeviceDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPrimary,
        leading: SvgPicture.asset('lib/assets/images/back.svg',
            height: 20, width: 20, fit: BoxFit.scaleDown),
        title: const Text(
          Strings.devices,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25, top: 20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.deviceID,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Poppins-Light',
                      ),
                    ),
                    Text(
                      "1234567890",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Poppins-Light',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 20, top: 15),
                  child: SvgPicture.asset(
                    "lib/assets/images/scan.svg",
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            decoration: BoxDecoration(
                color: grey,
                border: Border.all(color: grey),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 40),
                    alignment: Alignment.center,
                    child: Text(
                      "Data",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/power.svg',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            Strings.power,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "Primary",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/green.svg',
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20, top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: greylight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/gnss.svg',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            Strings.gnss,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "Not fixed",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/password.svg',
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20, top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: greylight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/schedule.svg',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            Strings.gsm,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.date + ":",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                                Text(
                                  "20 Dec 2023",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.time + ":",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                                Text(
                                  "08:20:21 AM",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20, top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: greylight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/ignition.svg',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            Strings.ignition,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SvgPicture.asset(
                          'lib/assets/images/ellipsered.svg',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "Off",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            Strings.idea,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "9876543210",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 2),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            Strings.bsnl,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "112233445566",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 3),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            Strings.currentOperation,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "Idea Cellular Ltd",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20, top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: greylight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 3),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            Strings.activationDate,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "03 Nov 2023",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20, top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: greylight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 3),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            Strings.expiryDate,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "03 Nov 2023",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20, top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: greylight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 3),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            Strings.location,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          child: Text(
                            " :",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppins-Light',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "lib/assets/images/googlemap.svg",
                                  width: 20,
                                  height: 20,
                                ),
                                Text(
                                  "Googke Map",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                  maxLines: 3,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            decoration: BoxDecoration(
                color: grey,
                border: Border.all(color: grey),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    child: Text(
                      "Commander",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            "SET TESTMON",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      backgroundColor: colorPrimary),
                                  onPressed: () {},
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: 'Poppins-Bold'),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 20, top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: greylight,
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
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
                        builder: (context) => DeviceDetail()));
                  },
                  child: const Text(
                    Strings.refresh,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )))
        ],
      )),
    );
  }
}
