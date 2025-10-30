class VehicleDetailsResponse {
  final bool? status;
  final VehicleDetailsData? data;
  final String? message;

  VehicleDetailsResponse({
    this.status,
    this.data,
    this.message,
  });

  factory VehicleDetailsResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return VehicleDetailsResponse();
    return VehicleDetailsResponse(
      status: json['status'] as bool?,
      data: json['data'] != null
          ? VehicleDetailsData.fromJson(json['data'] as Map<String, dynamic>?)
          : null,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
        'message': message,
      };
}

class VehicleDetailsData {
  final List<VehicleDetails>? vehicleDetails;

  VehicleDetailsData({this.vehicleDetails});

  factory VehicleDetailsData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return VehicleDetailsData();
    var list = json['vehicle_details'] as List?;
    return VehicleDetailsData(
      vehicleDetails: list
          ?.map((e) => VehicleDetails.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'vehicle_details': vehicleDetails?.map((e) => e.toJson()).toList(),
      };
}

class VehicleDetails {
  final String? vehicleNumber;
  final int? id;

  VehicleDetails({this.vehicleNumber, this.id});

  factory VehicleDetails.fromJson(Map<String, dynamic>? json) {
    if (json == null) return VehicleDetails();

    String? resolveName(Map<String, dynamic> map) {
      final List<String> nameKeys = [
        'vehicle_number',
        'vehicle_type',
        'vehicleType',
        'vehicle_type_name',
        'vehicleTypeName',
        'vehicle_name',
        'vehicleName',
        'type',
        'name',
        'title',
        'label',
      ];
      for (final key in nameKeys) {
        final value = map[key];
        if (value is String && value.trim().isNotEmpty) {
          return value;
        }
      }
      return null;
    }

    int? resolveId(Map<String, dynamic> map) {
      final dynamic raw = map['id'] ?? map['vehicle_type_id'] ?? map['value'];
      if (raw is int) return raw;
      if (raw is String) return int.tryParse(raw);
      return null;
    }

    return VehicleDetails(
      vehicleNumber: resolveName(json),
      id: resolveId(json),
    );
  }

  Map<String, dynamic> toJson() => {
        'vehicle_number': vehicleNumber,
        'id': id,
      };
}
