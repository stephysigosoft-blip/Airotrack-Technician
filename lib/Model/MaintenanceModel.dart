class MaintenanceData {
  int maintenance;
  String maintenanceReason;
  String androidVersion;
  int androidUpdate;

  MaintenanceData({
    required this.maintenance,
    required this.maintenanceReason,
    required this.androidVersion,
    required this.androidUpdate,
  });

  factory MaintenanceData.fromJson(Map<String, dynamic> json) =>
      MaintenanceData(
        maintenance: json["maintenance"] ?? 0,
        maintenanceReason: json["maintenance_reason"] ?? "",
        androidVersion: json["android_version"] ?? "1.0.0",
        androidUpdate: json["android_update"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "maintenance": maintenance,
        "maintenance_reason": maintenanceReason,
        "android_version": androidVersion,
        "android_update": androidUpdate,
      };
}
