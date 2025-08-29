import 'package:flutter/material.dart';

class RecentJobsScreen extends StatelessWidget {
  const RecentJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ["All", "New Installation", "Repair", "Replacement"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "Recent Jobs",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Filter chips
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FilterChip(
                    label: Text(filters[index]),
                    selected: index == 0,
                    onSelected: (_) {},
                    selectedColor: Colors.lightBlue.shade100,
                    backgroundColor: Colors.grey.shade200,
                    labelStyle: TextStyle(
                      color: index == 0 ? Colors.lightBlue : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemCount: filters.length,
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Scrollable content
            Expanded(
              child: ListView(
                children: [
                  buildDateSection("18 June 2025", [
                    buildJobCard("Camera", "New Installation", "Mullakal",
                        statusText: "Payment Pending", statusColor: Colors.blue),
                    buildJobCard("Speed Governor", "Repair", "Thumpoly",
                        amount: "₹800"),
                    buildJobCard("GPS Tracker", "Replacement", "Kommaday",
                        amount: "₹350"),
                    buildJobCard("Speed Governor", "Repair", "Mullakal",
                        amount: "₹500"),
                    buildJobCard("Camera", "New Installation", "Thumpoly",
                        amount: "₹600"),
                    buildJobCard("Speed Governor", "Repair", "Punnamada",
                        amount: "₹800"),
                  ]),
                  const SizedBox(height: 12),
                  buildDateSection("17 June 2025", [
                    buildJobCard("Camera", "Repair", "Punnamada",
                        amount: "₹1200"),
                    buildJobCard("GPS Tracker", "Repair", "Punnamada",
                        amount: "₹250"),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Date section widget
  Widget buildDateSection(String date, List<Widget> jobs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Column(children: jobs),
      ],
    );
  }

  /// 🔹 Job card widget
  Widget buildJobCard(
      String title,
      String subtitle,
      String location, {
        String? amount,
        String? statusText,
        Color? statusColor,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15)),
              const SizedBox(height: 2),
              Text(subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 14, color: Colors.lightBlue),
                  const SizedBox(width: 4),
                  Text(location,
                      style:
                      const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),

          // Right side
          if (amount != null)
            Text(
              amount,
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            )
          else if (statusText != null)
            Text(
              statusText,
              style: TextStyle(
                  color: statusColor ?? Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
        ],
      ),
    );
  }
}
