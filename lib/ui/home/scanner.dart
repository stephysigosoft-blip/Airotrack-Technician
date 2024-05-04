import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
                height: 300,
                width: 400,
                child: SimpleBarcodeScannerPage(
                  isShowFlashIcon: true,
                  scanType: ScanType.barcode,
                  cancelButtonText: "Cancel",
                  appBarTitle: "Scanner",
                )),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.flashlight_on, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        "Flash",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.add_photo_alternate,
                          color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        "Upload From Gallery",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
