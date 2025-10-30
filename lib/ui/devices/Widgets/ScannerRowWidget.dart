import 'package:airotrackgit/ui/devices/devicedetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:airotrackgit/ui/utils/utils.dart';

import '../../../assets/resources/colors.dart';

class ScannerRowWidget extends StatelessWidget {
  const ScannerRowWidget({
    super.key,
    required this.media,
    required this.controller,
  });

  final Size media;
  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: media.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: media.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(media.height * 0.01),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        await controller.toggleTorch();
                      } catch (_) {}
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/flash.svg',
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(width: media.width * 0.02),
                        const Text(
                          'Flash',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(media.width * 0.02),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image == null) return;

                        final capture =
                            await controller.analyzeImage(image.path);
                        if (capture != null && capture.barcodes.isNotEmpty) {
                          final value = capture.barcodes.first.rawValue;
                          if (value != null && value.isNotEmpty) {
                            Get.back(result: value);
                            showToast('Barcode found in image: $value');
                            Get.to(() => DeviceDetail(imei: value));
                            return;
                          }
                        }
                        showToast('No Barcode found in image');
                      } catch (e) {
                        showToast('Failed to scan image: $e');
                      }
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/gallery.svg',
                          width: media.width * 0.02,
                          height: media.height * 0.02,
                        ),
                        SizedBox(width: media.width * 0.02),
                        const Text(
                          'Upload from gallery',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
