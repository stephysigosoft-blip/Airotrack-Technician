import 'package:airotrackgit/assets/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class EarningsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("EarningsController initialized");
    getFormattedDate();
  }

  @override
  void onClose() {
    debugPrint("EarningsController disposed");
    super.onClose();
  }

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  final earnings = [
    {"location": "Mullakal", "product": "Camera", "amount": "₹850"},
    {"location": "Thumpoly", "product": "Speed Governor", "amount": "₹800"},
    {"location": "Komady", "product": "GPS Tracker", "amount": "₹350"},
    {"location": "Mullakal", "product": "Speed Governor", "amount": "₹500"},
    {"location": "Thumpoly", "product": "Camera", "amount": "₹600"},
    {"location": "Punnamada", "product": "Speed Governor", "amount": "₹800"},
  ];

  getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);
    fromDateController.text = formattedDate;
    toDateController.text = formattedDate;
  }

  onFromDateTapped(context) {
    pickDate(context:context).then((selectedDate) {
      if (selectedDate != null) {
        fromDateController.text = selectedDate;
        update();
      }
    });
  }

  onToDateTapped(context) {
    pickDate(context:context).then((selectedDate) {
      if (selectedDate != null) {
        toDateController.text = selectedDate;
        update();
      }
    });
  }

  Future<String?> pickDate({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorPrimary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      return DateFormat("dd/MM/yyyy").format(picked);
    }
    return null;
  }



}
