class HomeModel {
  final bool status;
  final Data? data;
  final String? message;

  HomeModel({
    required this.status,
    this.data,
    this.message,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'] ?? false,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'] ?? '',
    );
  }
}

class Data {
  final Technician? technician;
  final List<Work> pendingWorks;
  final List<Work> ongoingWorks;
  final List<Work> completedWorks;

  Data({
    this.technician,
    required this.pendingWorks,
    required this.ongoingWorks,
    required this.completedWorks,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      technician: json['technician'] != null
          ? Technician.fromJson(json['technician'])
          : null,
      pendingWorks: (json['pending_works'] as List? ?? [])
          .map((e) => Work.fromJson(e))
          .toList(),
      ongoingWorks: (json['ongoing_works'] as List? ?? [])
          .map((e) => Work.fromJson(e))
          .toList(),
      completedWorks: (json['completed_works'] as List? ?? [])
          .map((e) => Work.fromJson(e))
          .toList(),
    );
  }
}

class Technician {
  final int? id;
  final String? userName;
  final String? name;
  final String? email;
  final String? mobile;
  final String? address;
  final String? companyName;
  final int? roleId;
  final String? profileImg;
  final int? status;
  final int? regStatus;
  final int? countryCodeId;
  final String? createdAt;
  final String? updatedAt;

  Technician({
    this.id,
    this.userName,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.companyName,
    this.roleId,
    this.profileImg,
    this.status,
    this.regStatus,
    this.countryCodeId,
    this.createdAt,
    this.updatedAt,
  });

  factory Technician.fromJson(Map<String, dynamic> json) {
    return Technician(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'],
      companyName: json['company_name'],
      roleId: json['role_id'] ?? 0,
      profileImg: json['profile_img'] ?? '',
      status: json['status'] ?? 0,
      regStatus: json['reg_status'] ?? 0,
      countryCodeId: json['country_code_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class Work {
  final int? id;
  final int? productId;
  final int? serviceType;
  final String? vehicleNo;
  final String? vehicleType;
  final String? customerName;
  final String? mobile;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? date;
  final String? totalAmount;
  final int? technicianId;
  final String? startTime;
  final String? endTime;
  final String? startLat;
  final String? startLong;
  final String? endLat;
  final String? endLong;
  final int? deviceId;
  final String? imei;
  final int? jobStatus;
  final String? technicianName;
  final String? productName;

  Work({
    this.id,
    this.productId,
    this.serviceType,
    this.vehicleNo,
    this.vehicleType,
    this.customerName,
    this.mobile,
    this.location,
    this.latitude,
    this.longitude,
    this.date,
    this.totalAmount,
    this.technicianId,
    this.startTime,
    this.endTime,
    this.startLat,
    this.startLong,
    this.endLat,
    this.endLong,
    this.deviceId,
    this.imei,
    this.jobStatus,
    this.technicianName,
    this.productName,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      serviceType: json['service_type'] ?? 0,
      vehicleNo: json['vehicle_no'] ?? '',
      vehicleType: json['vehicle_type'] ?? '',
      customerName: json['customer_name'] ?? '',
      mobile: json['mobile'] ?? '',
      location: json['location'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      date: json['date'] ?? '',
      totalAmount: json['total_amount'] ?? '',
      technicianId: json['technician_id'] ?? 0,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      startLat: json['start_lat'] ?? '',
      startLong: json['start_long'] ?? '',
      endLat: json['end_lat'] ?? '',
      endLong: json['end_long'] ?? '',
      deviceId: json['device_id'] ?? 0,
      imei: json['imei'] ?? '',
      jobStatus: json['job_status'] ?? 0,
      technicianName: json['technician_name'] ?? '',
      productName: json['product_name'] ?? '',
    );
  }
}
