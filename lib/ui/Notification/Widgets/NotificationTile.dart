import 'package:airotrackgit/ui/utils/Widgets/NormalTextPoppins.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String message;

  const NotificationTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: NormalTextPoppins(
            text: message, color: Colors.black, fontSize: 14));
  }
}
