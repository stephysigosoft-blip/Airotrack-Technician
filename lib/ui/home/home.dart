import 'package:airotrackgit/ui/devices/devicedetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/controller/home_controller.dart';
import 'package:airotrackgit/ui/about/About.dart';
import 'package:airotrackgit/ui/contactus/contactus.dart';
import 'package:airotrackgit/ui/devices/qrview.dart';
import 'package:airotrackgit/ui/privacy/privacy.dart';
import 'package:airotrackgit/ui/terms/terms_condition.dart';

import 'widget/clock_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PackageInfo? packageInfo;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      packageInfo = await PackageInfo.fromPlatform();
      setState(() {});
    });
    super.initState();
  }

  TextEditingController deviceIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: SvgPicture.asset(
                'lib/assets/images/logosplash.svg',
                height: 60,
              ),
            ),
            drawer: UserDrawer(
              packageInfo: packageInfo,
            ),
            body: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            margin: const EdgeInsets.only(
                                top: 30, left: 20, right: 20),
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
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 25),
                                      child: const Text(
                                        Strings.welcome,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Poppins-Regular'),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 15),
                                      child: Text(
                                        controller.homeData?.firstName ??
                                            "user name",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins-Bold'),
                                      )),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 25, left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              'lib/assets/images/calendar.svg',
                                              width: 20,
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              DateFormat('dd MMM yyyy')
                                                  .format(DateTime.now()),
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins-Regular',
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              'lib/assets/images/schedulewhite.svg',
                                              width: 20,
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const ClockWidget(),
                                            const SizedBox(
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
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 25),
                          child: const Text(
                            Strings.scanDevice,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins-Bold'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QRViewExample(),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
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
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 25),
                          child: const Text(
                            Strings.deviceID,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins-Bold'),
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter a device id";
                                }
                                // if (value.length > 10) {
                                //   return "Enter a valid device id";
                                // }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: deviceIdController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  Get.to(DeviceDetail(
                                    deviceId: value,
                                  ));
                                  deviceIdController.clear();
                                }
                              },
                              decoration: InputDecoration(
                                  constraints:
                                      const BoxConstraints(minHeight: 55),
                                  suffixIcon: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: colorPrimary,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Get.to(DeviceDetail(
                                          deviceId:
                                              deviceIdController.text.trim(),
                                        ));
                                        deviceIdController.clear();
                                      }
                                    },
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),

                                  //  InkWell(

                                  //  In
                                  //   child: Container(
                                  //     height: 55, width: 55,
                                  //     color: colorPrimary,
                                  //     // borderRadius:
                                  //     //     BorderRadius.all(Radius.circular(4)),
                                  //     child:
                                  //   ),
                                  // ),
                                  fillColor: greybg,
                                  filled: true,
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: blacklite, width: 1.0),
                                      borderRadius: BorderRadius.circular(4)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: blacklite, width: 1.0),
                                      borderRadius: BorderRadius.circular(4)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: blacklite, width: 1.0),
                                      borderRadius: BorderRadius.circular(4)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: blacklite, width: 1.0),
                                      borderRadius: BorderRadius.circular(4)),
                                  hintText: "Enter Device ID",
                                  hintStyle: const TextStyle(color: blacklite)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
      },
    );
  }
}

class UserDrawer extends StatefulWidget {
  final PackageInfo? packageInfo;
  const UserDrawer({super.key, this.packageInfo});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset('lib/assets/images/logosplash.svg'),
                )),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        size: 30,
                        Icons.close,
                      ),
                    )),
              ],
            ),
          ),
          TitleTile(
            img: 'lib/assets/images/contactus.svg',
            title: Strings.contactus,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
          ),
          TitleTile(
            img: 'lib/assets/images/aboutus.svg',
            title: Strings.aboutUs,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
          ),
          TitleTile(
            img: 'lib/assets/images/privacy.svg',
            title: Strings.privacyPolicy,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Privacy()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
          ),
          TitleTile(
            img: 'lib/assets/images/terms.svg',
            title: Strings.terms,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsCondition()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
          ),
          TitleTile(
            img: 'lib/assets/images/logout.svg',
            title: 'Logout',
            trailImg: 'lib/assets/images/arrowred.svg',
            titlestyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.red),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: SvgPicture.asset(
                          "lib/assets/images/logout.svg",
                          color: Colors.black,
                          height: 80,
                        ),
                        content: Text(
                          "Are you sure you want to logout?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        actions: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "No",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: colorPrimary,
                            ),
                            onPressed: () async {
                              await Get.find<HomeController>().logoutAPI();
                            },
                            child: Text(
                              "Yes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ));
            },
          ),
          const Spacer(),
          Text(
            "V${widget.packageInfo?.version}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Check for updates",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(decoration: TextDecoration.underline),
              )),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class TitleTile extends StatelessWidget {
  final String title;
  final String img;
  final String trailImg;
  final TextStyle? titlestyle;
  final void Function()? onTap;
  const TitleTile({
    super.key,
    required this.title,
    required this.img,
    this.titlestyle,
    this.trailImg = 'lib/assets/images/arrow.svg',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        img,
        width: 36,
        height: 36,
      ),
      trailing: SvgPicture.asset(
        trailImg,
        width: 15,
        height: 15,
      ),
      title: Text(title,
          style: titlestyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600, letterSpacing: 1)),
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
    );
  }
}
