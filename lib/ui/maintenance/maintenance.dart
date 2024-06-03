import 'package:flutter/material.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => MMaintenanceScreenState();
}

class MMaintenanceScreenState extends State<MaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("lib/assets/images/maintenance.png"),
            const SizedBox(height: 20),
            Text(
              "We'll be back soon",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Sorry, we're down for maintenance \nWe'll be back up shortly",
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
