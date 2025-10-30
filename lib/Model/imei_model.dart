class IMEIModel {
  final int? id;
  final String? imei;
  final String? vehicleNo;

  IMEIModel({
    this.id,
    this.imei,
    this.vehicleNo,
  });

  factory IMEIModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return IMEIModel();
    return IMEIModel(
      id: json["id"] is int ? json["id"] as int? : int.tryParse(json["id"]?.toString() ?? ''),
      imei: json["imei"]?.toString() ?? "",
      vehicleNo: json["vehicle_no"]?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? 0,
      "imei": imei ?? "",
      "vehicle_no": vehicleNo ?? "",
    };
  }

  static List<IMEIModel> fromJsonList(List<dynamic>? list) {
    return list?.map((e) => IMEIModel.fromJson(e as Map<String, dynamic>?)).toList() ?? [];
  }
}
