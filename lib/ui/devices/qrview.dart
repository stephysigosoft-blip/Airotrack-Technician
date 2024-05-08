import 'dart:developer';
import 'dart:io';


import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:airotrackgit/ui/devices/devicedetails.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart' as cameraBarCode;

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  cameraBarCode.Barcode? result;
  var extractedBarcode='';
  cameraBarCode.QRViewController? controller;
  var selectedImagePath='';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: SvgPicture.asset('lib/assets/images/close.svg',
                width: 25,
                height: 25,),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // selectedImagePath == ''?
          Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              height: 450, child: _buildQrView(context)),
            /* Container(
               margin: EdgeInsets.only(left: 20,right: 20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10)
               ),
               height: 450,
               child:  Image.file(File(selectedImagePath),)
             ),*/
          Container(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  /*if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),*/
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )

                          ),
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('lib/assets/images/flash.svg',width: 15,height: 15,),
                                SizedBox(
                                  width: 7,
                                ),
                                Text('Flash',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                    ))
                                  ],
                                );
                              },
                            )),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.all(8),
                      //   child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //           backgroundColor: colorPrimary,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(12)
                      //           )
                      //
                      //       ),
                      //       onPressed: () async {
                      //         // getImage(ImageSource.gallery);
                      //
                      //       },
                      //       child: FutureBuilder(
                      //         future: controller?.getFlashStatus(),
                      //         builder: (context, snapshot) {
                      //           return Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: [
                      //               SvgPicture.asset('lib/assets/images/gallery.svg',width: 15,height: 15,),
                      //               SizedBox(
                      //                 width: 7,
                      //               ),
                      //               Text('Upload from gallery',
                      //                   style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontSize: 15
                      //                   ))
                      //             ],
                      //           );
                      //         },
                      //       )),
                      // ),
                    ],
                  ),
                /*  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),*/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return cameraBarCode.QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: cameraBarCode.QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(cameraBarCode.QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Get.to(DeviceDetail(imei: result!.code!));
      });
    });
  }

  void _onPermissionSet(BuildContext context, cameraBarCode.QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  /*getImage(ImageSource imageSource) async{
    final pickedFile= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      selectedImagePath=pickedFile.path;
      setState(() {});
      extractedBarcode = '';
      var barCodeScanner = GoogleMlKit.vision.barcodeScanner();
      final visionImage = InputImage.fromFilePath(selectedImagePath);
      try{
        var barcodeText= await barCodeScanner.processImage(visionImage);
        for(Barcode barcode in barcodeText){
          extractedBarcode=barcode.displayValue!;
          Get.to(DeviceDetail(imei: extractedBarcode.toString()));
      }
      }
      catch(e){
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    }
    else{
      Get.snackbar("Error", "image is not selected", backgroundColor: Colors.red);
    }

  }
  Future<void> recognizedText(String pickedImage) async {
    if (pickedImage == null) {
      Get.snackbar(

          "Error", "image is not selected"
          ,
          backgroundColor: Colors.red);
    }
    else {
      extractedBarcode = '';
      var barCodeScanner = GoogleMlKit.vision.barcodeScanner();
      final visionImage = InputImage.fromFilePath(pickedImage);
      try{

        var barcodeText= await barCodeScanner.processImage(visionImage);

        for(Barcode barcode in barcodeText){
          extractedBarcode=barcode.displayValue!;

        }
      }
      catch(e){
        Get.snackbar(

            "Error", e.toString()
            ,
            backgroundColor: Colors.red);
      }
    }
  }*/

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}