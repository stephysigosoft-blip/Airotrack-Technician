import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/assets/resources/strings.dart';
import 'package:airotrackgit/ui/devices/qrview.dart';
import 'package:airotrackgit/controller/home_controller.dart';
import 'package:airotrackgit/ui/about/About.dart';
import 'package:airotrackgit/ui/contactus/contactus.dart';
import 'package:airotrackgit/ui/home/scanner.dart';
import 'package:airotrackgit/ui/privacy/privacy.dart';
import 'package:airotrackgit/ui/terms/terms_condition.dart';
import 'package:airotrackgit/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../devices/scan_details.dart';

class Home extends StatelessWidget {
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
    savename('token', "12|4gHsT0nP8Nn2sjjrGtrzHyqteuIopK5ttT2D0yJE3fe93514");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      packageInfo = await PackageInfo.fromPlatform();
      setState(() {});
    });
    super.initState();
  }

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
                : Column(
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
                                  margin:
                                      const EdgeInsets.only(top: 25, left: 15),
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
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 25),
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
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                  builder: (context) =>
                                      const SimpleBarcodeScannerPage(
                                    isShowFlashIcon: true,
                                    scanType: ScanType.barcode,
                                    cancelButtonText: "Cancel",
                                    appBarTitle: "Scanner",
                                  ),
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
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 25),
                        child: const Text(
                          Strings.deviceID,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins-Bold'),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: const Material(
                                elevation: 2.0,
                                color: colorPrimary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              fillColor: greybg,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: blacklite, width: 1.0),
                                  borderRadius: BorderRadius.circular(4)),
                              hintText: "Enter Device ID",
                              hintStyle: const TextStyle(color: blacklite)),
                        ),
                      )
                    ],
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
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
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
            title: Text(Strings.contactus,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 35, top: 20),
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
            title: Text(Strings.privacyPolicy,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Privacy()));
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 35, top: 20),
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
            title: Text(Strings.aboutUs,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 35, top: 20),
            height: 1,
            color: greyline,
          ),
          ListTile(
            leading: SvgPicture.asset(
              'lib/assets/images/terms.svg',
              width: 20,
              height: 20,
            ),
            title: Text(Strings.terms,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
            trailing: SvgPicture.asset(
              'lib/assets/images/arrow.svg',
              width: 15,
              height: 15,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsCondition()));
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 35, top: 20),
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
            title: Text(
              'Logout',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.red),
            ),
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
                            onPressed: () {},
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
