import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

final storagebox = GetStorage();
saveObject(String key, value) {
  try {
    storagebox.write(key, json.encode(value));
  } catch (e) {
    rethrow;
  }
}

savename(String key, value) {
  try {
    storagebox.write(key, json.encode(value));
  } catch (e) {
    rethrow;
  }
}

getSavedObject(String key) {
  var data = storagebox.read(key);
  return data != null ? json.decode(data) : null;
}

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

removename(String key) async {
  try {
    storagebox.remove(key);
  } catch (e) {
    rethrow;
  }
}

showErrorMessage(error) {
  if (!error.toString().contains("setState()")) {
    if (error is DioException) {
      DioException e = error;
      print("Error is :" + error.response!.data.toString());
      var message = e.response!.data["exception"];
      if (message == null) {
        message = e.response!.data["exception"];
        if (message == null) {
          message = "Oops Something went wrong try again !!";
        }
      } else {
        message = e.response!.data["exception"];
      }
      Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: error?.toString() ?? "Oops Something went wrong try again !!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

showToast(String message, {BuildContext? context, SnackBarAction? action}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 4,
      gravity: ToastGravity.BOTTOM,
      webBgColor: '#000000',
      backgroundColor: Colors.black,
      webPosition: "center",
      textColor: Colors.white,
      fontSize: 16.0);
}

extension PrettyJson on Map<String, dynamic> {
  String toPrettyString() {
    var encoder = const JsonEncoder.withIndent("     ");
    return encoder.convert(this);
  }
}

showErrorToast(Map<String, dynamic> message) {
  if (message.containsKey('mobile')) {
    if (message['mobile'].isNotEmpty) {
      showToast(message['mobile'][0] ?? "Something went wrong");
    }
  }
  if (message.containsKey('password')) {
    if (message['password'].isNotEmpty) {
      showToast(message['password'][0] ?? "Something went wrong");
    }
  }
  if (message.containsKey('email')) {
    if (message['email'].isNotEmpty) {
      showToast(message['email'][0] ?? "Something went wrong");
    }
  }
  if (message.containsKey('facility_address')) {
    if (message['facility_address'].isNotEmpty) {
      showToast(message['facility_address'][0] ?? "Something went wrong");
    }
  }
  if (message.containsKey('tax_number')) {
    if (message['tax_number'].isNotEmpty) {
      showToast(message['tax_number'][0] ?? "Something went wrong");
    }
  }
}
 Future<bool> checkNetwork() async {
  try {
    List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
    print(connectivityResult);
    print(connectivityResult.contains(ConnectivityResult.wifi)); // Check if wifi is in the list
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      final result = await InternetAddress.lookup('google.com');
      print("Result: ${result}");
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}


