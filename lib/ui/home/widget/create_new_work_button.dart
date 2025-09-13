import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../assets/resources/colors.dart';
import '../../CreateNewWork/CreateNewWork.dart';

class CreateNewWorkButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateNewWorkButton({
    super.key,required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 20, right: 20, top: 10),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: () =>onPressed,
        child: const Text(
          "Create New Work",
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}