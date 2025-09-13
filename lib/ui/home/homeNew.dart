import 'package:airotrackgit/ui/CreateNewWork/CreateNewWork.dart';
import 'package:airotrackgit/ui/home/widget/home_welcome_card.dart';
import 'package:airotrackgit/ui/home/widget/work_type_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:airotrackgit/controller/home_controller.dart';
import 'home.dart';
import 'widget/create_new_work_button.dart';

class HomeNew extends StatefulWidget {
  const HomeNew({super.key});

  @override
  State<HomeNew> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> with SingleTickerProviderStateMixin {
  PackageInfo? packageInfo;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late final TabController tabController;
  final List<String> tabs = const [
    'All',
    'New Installations',
    'Repair',
    'Replace',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      packageInfo = await PackageInfo.fromPlatform();
      tabController = TabController(length: tabs.length, vsync: this);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TextEditingController deviceIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final homeController = Get.lazyPut(() => HomeController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (controller) {
          if (controller.homeData == null) {
            return const Scaffold(body: Center(child: Text("No Data found")));
          } else {
            var technician = controller.homeData?.data?.technician;
            return Scaffold(
                key: scaffoldKey,
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
                  scaffoldKey: scaffoldKey,
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
                            HomeWelcomeCard(userName: technician?.name ?? ""),
                            CreateNewWorkButton(
                              onPressed: () =>
                                  Get.to(const CreateNewWorkScreen()),
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    WorkTypeDetails(
                                      workType: "Job Request",
                                      theme: theme,
                                      onAcceptTapped: () => controller
                                          .showAcceptJobDialog(context),
                                      tabController: tabController,
                                      tab: tabs,
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                                itemCount: 3)
                          ],
                        ),
                      ));
          }
        });
  }
}
