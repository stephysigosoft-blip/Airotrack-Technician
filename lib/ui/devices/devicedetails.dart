import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/controller/details_controller.dart';

class DeviceDetail extends StatefulWidget {
  const DeviceDetail({
    super.key,
    required this.imei,
  });

  final String imei;

  @override
  State<DeviceDetail> createState() => _DeviceDetailState();
}

class _DeviceDetailState extends State<DeviceDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      initState: (_) {},
      didChangeDependencies: (state) {
        state.controller?.getDeatils(widget.imei);
      },
      builder: (controller) {
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
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 25, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                Strings.deviceID,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'Poppins-Light',
                                ),
                              ),
                              Text(
                                controller.deviceDetails?.id.toString() ?? "id",
                                style: const TextStyle(
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
                            margin: const EdgeInsets.only(right: 20, top: 15),
                            child: SvgPicture.asset(
                              "lib/assets/images/scan.svg",
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 10),
                      decoration: BoxDecoration(
                          color: grey,
                          border: Border.all(color: grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: SizedBox(
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
                              child: const Text(
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
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SvgPicture.asset(
                                    'lib/assets/images/power.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: const Text(
                                      Strings.power,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
                                      " :",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller.deviceDetails!.power == 1
                                          ? "Primary"
                                          : "Off",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            controller.deviceDetails!.power == 1
                                                ? Colors.green
                                                : Colors.red),
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 15),
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
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SvgPicture.asset(
                                    'lib/assets/images/gnss.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: const Text(
                                      Strings.gnss,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
                                      " :",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller.deviceDetails!.gnssFix == 1
                                          ? "Fixed"
                                          : "Not fixed",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            controller.deviceDetails!.gnssFix ==
                                                    1
                                                ? Colors.green
                                                : Colors.red),
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 15),
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: greylight,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SvgPicture.asset(
                                    'lib/assets/images/schedule.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: const Text(
                                      Strings.gsm,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
                                      " :",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${Strings.date}:",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${Strings.time}:",
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
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 15),
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
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SvgPicture.asset(
                                    'lib/assets/images/ignition.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: const Text(
                                      Strings.ignition,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
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
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller
                                                    .deviceDetails!.ignition ==
                                                1
                                            ? Colors.green
                                            : Colors.red),
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller.deviceDetails!.ignition == 1
                                          ? "On"
                                          : "Off",
                                      style: const TextStyle(
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
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      Strings.idea,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller
                                          .deviceDetails!.primaryMobileNumber,
                                      style: const TextStyle(
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
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      Strings.bsnl,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller
                                          .deviceDetails!.secondaryMobileNumber,
                                      style: const TextStyle(
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
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      Strings.currentOperation,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      controller.deviceDetails!.simProvider,
                                      style: const TextStyle(
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
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 5),
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
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      Strings.activationDate,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
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
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 5),
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
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      Strings.expiryDate,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
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
                              margin: const EdgeInsets.only(
                                  left: 15, right: 20, top: 5),
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
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text(
                                      Strings.location,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins-Light',
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    child: const Text(
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
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            "lib/assets/images/googlemap.svg",
                                            width: 20,
                                            height: 20,
                                          ),
                                          const Text(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 10),
                      decoration: BoxDecoration(
                          color: grey,
                          border: Border.all(color: grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: SizedBox(
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
                              child: const Text(
                                "Commander",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                separatorBuilder: (_, i) => const Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.commands.length,
                                itemBuilder: (_, i) {
                                  var command = controller.commands[i];
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          command.command,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              height: 35,
                                              child: VerticalDivider(
                                                color: Colors.grey,
                                                thickness: 3,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                    backgroundColor:
                                                        colorPrimary),
                                                onPressed: () async {
                                                  await controller.sendCommands(
                                                      widget.imei,
                                                      command.id.toString());
                                                },
                                                child: const Text(
                                                  "Send",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Poppins-Bold'),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                })
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
                                  builder: (context) => DeviceDetail(
                                        imei: widget.imei,
                                      )));
                            },
                            child: const Text(
                              Strings.refresh,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )))
                  ],
                )),
        );
      },
    );
  }
}
