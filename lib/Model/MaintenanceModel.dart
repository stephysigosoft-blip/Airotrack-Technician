class MaintenanceData {
  int maintenance;
  dynamic maintenanceReason;
  String androidVersion;
  int androidUpdate;

  MaintenanceData({
    required this.maintenance,
    required this.maintenanceReason,
    required this.androidVersion,
    required this.androidUpdate,
  });

  factory MaintenanceData.fromJson(Map<String, dynamic> json) => MaintenanceData(
        maintenance: json["maintenance"],
        maintenanceReason: json["maintenance_reason"],
        androidVersion: json["android_version"],
        androidUpdate: json["android_update"],
      );

  Map<String, dynamic> toJson() => {
        "maintenance": maintenance,
        "maintenance_reason": maintenanceReason,
        "android_version": androidVersion,
        "android_update": androidUpdate,
      };
}
