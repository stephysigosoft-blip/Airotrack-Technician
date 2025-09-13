import 'dart:io';

import 'package:airotrackgit/Controller/ProductCertificateController.dart';
import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/home/home.dart';
import 'package:airotrackgit/ui/home/homeNew.dart';
import 'package:airotrackgit/ui/utils/Widgets/CheckInButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../assets/resources/strings.dart';
import '../utils/Widgets/CustomAppBar.dart';
import 'Widget/CustomOffsetFABLocation.dart';

class ProductCertificateScreen extends StatefulWidget {
  const ProductCertificateScreen({super.key});

  @override
  State<ProductCertificateScreen> createState() =>
      _ProductCertificateScreenState();
}

class _ProductCertificateScreenState extends State<ProductCertificateScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
        top: false,
        child: GetBuilder(
          init: ProductCertificateController(),
          builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: colorPrimary,
              onPressed: () {},
              child: SvgPicture.asset("lib/assets/images/share_icon.svg"),
            ),
            floatingActionButtonLocation: const CustomOffsetFABLocation(80),
            appBar: CustomAppBar(
                title: Strings.productCertificate, onBack: () => Get.back()),
            body: Padding(
              padding: EdgeInsets.all(media.width * 0.03),
              child: Column(
                children: [
                  Expanded(
                    child: controller.localPdfPath == null
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: colorPrimary,
                          ))
                        : PDFView(
                            filePath: controller.localPdfPath!,
                          ),
                  ),
                  const Spacer(),
                  CheckInButton(onTap: () => Get.offAll(const HomeNew()),
                      media: media, buttonText: Strings.goToMainMenu)
                ],
              ),
            ),
          ),
        ));
  }
}
