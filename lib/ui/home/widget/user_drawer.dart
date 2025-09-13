import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../Controller/home_controller.dart';
import '../../../assets/resources/colors.dart';
import '../../../assets/resources/strings.dart';
import '../../Earnings/Earnings.dart';
import '../../Notification/NotificationScreen.dart';
import '../../RecentJobs/RecentJobs.dart';
import '../../ScanDevices/ScanDevice.dart';
import '../../about/About.dart';
import '../../contactus/contactus.dart';
import '../../privacy/privacy.dart';
import '../../terms/terms_condition.dart';
import '../home.dart';

class UserDrawer extends StatefulWidget {
  final PackageInfo? packageInfo;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const UserDrawer({
    super.key,
    this.packageInfo,
    required this.scaffoldKey,
  });

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  AppUpdateInfo? updateInfo;

  Future<void> checkForUpdate() async {
    Navigator.pop(context);
    InAppUpdate.checkForUpdate().then((info) {}).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (widget.scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(widget.scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(
          content: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          SizedBox(
            height: media.height * 0.16,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(media.height * 0.01),
                    child: SvgPicture.asset('lib/assets/images/logosplash.svg'),
                  ),
                ],
              ),
            ),
          ),
          TitleTile(
            img: 'lib/assets/images/earnings_icon.svg',
            title: Strings.earnings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EarningsScreen()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
          ),
          TitleTile(
            img: 'lib/assets/images/earnings_icon.svg',
            title: Strings.recentJobs,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RecentJobsScreen()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
          ),
          TitleTile(
            img: 'lib/assets/images/scandevice_icon.svg',
            title: Strings.scanDevice,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScanDeviceScreen()));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsCondition()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
          ),
          TitleTile(
            img: 'lib/assets/images/earnings_icon.svg',
            title: Strings.notifications,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 1,
            color: greyline,
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
            img: 'lib/assets/images/privacy.svg',
            title: Strings.privacyPolicy,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Privacy()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutUs()));
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
            onTap: () => Get.put(HomeController()).logoutDialog(context),
          ),
          SizedBox(height: media.height * 0.018),
          Align(
            alignment: Alignment.center,
            child: Text(
              "V${widget.packageInfo?.version}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextButton(
              onPressed: () => checkForUpdate(),
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