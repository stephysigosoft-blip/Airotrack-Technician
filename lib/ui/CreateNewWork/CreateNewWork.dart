import 'package:airotrackgit/Controller/CreateNewWorkController.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/home/homeNew.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:airotrackgit/ui/utils/Widgets/CustomAppBar.dart';
import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/resources/strings.dart';
import 'Widgets/CountryCodeAndMobile.dart';
import 'Widgets/CreateNewWorkDropDown.dart';
import 'Widgets/CreateNewWorkSearchField.dart';
import 'Widgets/CreateNewWorkTextField.dart';
import 'Widgets/LabelTextWidget.dart';

class CreateNewWorkScreen extends StatelessWidget {
  const CreateNewWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: GetBuilder(
        init: CreateNewWorkController(),
        builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
              title: Strings.createNewWork, onBack: () => Get.back()),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(media.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelTextWidget(label: Strings.productName),
                SizedBox(height: media.height * 0.005),
                CreateNewWorkDropDown(
                  media: media,
                  hintText: Strings.pickAProduct,
                  items: controller.productList,
                  value: controller.selectedProduct,
                  onChanged: (value) {
                    controller.selectedProduct = value;
                  },
                ),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.workType),
                SizedBox(height: media.height * 0.005),
                CreateNewWorkDropDown(
                  media: media,
                  hintText: Strings.selectWorkType,
                  items: controller.workTypes,
                  value: controller.selectedWorkType,
                  onChanged: (value) {
                    controller.selectedProduct = value;
                  },
                ),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.selectIMEINumber),
                SizedBox(height: media.height * 0.005),
                CreateNewWorkSearchField(
                    hintText: Strings.searchIMEIorVehicle, media: media),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.customerName),
                SizedBox(height: media.height * 0.005),
                CreateNewWorkTextField(
                    hintText: Strings.enterCustomerName, media: media),
                const SizedBox(height: 16),
                const LabelTextWidget(label: Strings.mobileNumber),
                SizedBox(height: media.height * 0.005),
                CountryCodeAndMobile(media: media),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.vehicleNumber2),
                SizedBox(height: media.height * 0.005),
                CreateNewWorkTextField(
                    hintText: Strings.vehicleNumber2, media: media),
                SizedBox(height: media.height * 0.018),
                const LabelTextWidget(label: Strings.location),
                SizedBox(height: media.height * 0.005),
                CreateNewWorkSearchField(
                    hintText: Strings.searchLocation, media: media),
                SizedBox(height: media.height * 0.018),
                Row(
                  children: [
                    const Icon(Icons.map_outlined, color: colorPrimary),
                    SizedBox(width: media.width * 0.02),
                    const NormalTextPoppins(
                        text: Strings.chooseOnMap,
                        color: colorPrimary,
                        fontSize: 15)
                  ],
                ),
                SizedBox(height: media.height * 0.04),
                CheckInButton(
                    onTap: () => Get.off(const HomeNew()),
                    media: media,
                    buttonText: Strings.createWork)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
