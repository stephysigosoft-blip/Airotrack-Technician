class SpeedGovernorModel {
  final String? status;
  final SpeedGovernorData? data;

  SpeedGovernorModel({
    this.status,
    this.data,
  });

  factory SpeedGovernorModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SpeedGovernorModel();

    return SpeedGovernorModel(
      status: json['status']?.toString(),
      data: json['data'] != null
          ? SpeedGovernorData.fromJson(json['data'] as Map<String, dynamic>?)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class SpeedGovernorData {
  final List<SpeedGovernor>? speedGovernors;

  SpeedGovernorData({this.speedGovernors});

  factory SpeedGovernorData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SpeedGovernorData();

    return SpeedGovernorData(
      speedGovernors: (json['speedGovernors'] as List?)
          ?.map((e) => SpeedGovernor.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'speedGovernors': speedGovernors?.map((e) => e.toJson()).toList(),
    };
  }
}

class SpeedGovernor {
  final int? id;
  final String? vehicleMake;
  final String? vehicleModel;
  final String? speed;
  final String? testReportNo;
  final String? sgTacNumber;
  final String? copNumber;
  final String? sgModel;
  final String? companyName;
  final String? sldType;

  SpeedGovernor({
    this.id,
    this.vehicleMake,
    this.vehicleModel,
    this.speed,
    this.testReportNo,
    this.sgTacNumber,
    this.copNumber,
    this.sgModel,
    this.companyName,
    this.sldType,
  });

  factory SpeedGovernor.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SpeedGovernor();

    return SpeedGovernor(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
      vehicleMake: json['vehicle_make']?.toString(),
      vehicleModel: json['vehicle_model']?.toString(),
      speed: json['speed']?.toString(),
      testReportNo: json['test_report_no']?.toString(),
      sgTacNumber: json['sg_tac_number']?.toString(),
      copNumber: json['cop_number']?.toString(),
      sgModel: json['sg_model']?.toString(),
      companyName: json['company_name']?.toString(),
      sldType: json['sld_type']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_make': vehicleMake,
      'vehicle_model': vehicleModel,
      'speed': speed,
      'test_report_no': testReportNo,
      'sg_tac_number': sgTacNumber,
      'cop_number': copNumber,
      'sg_model': sgModel,
      'company_name': companyName,
      'sld_type': sldType,
    };
  }
}
