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
  final List<UpcomingWorks> upcomingWorks;

  Data({
    this.technician,
    required this.pendingWorks,
    required this.ongoingWorks,
    required this.completedWorks,
    required this.upcomingWorks,
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
      upcomingWorks: (json['upcoming_works'] as List? ?? [])
          .map((e) => UpcomingWorks.fromJson(e))
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
  final String? remarks;

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
    this.remarks,
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
      remarks: json['remarks'] ?? '',
    );
  }
}

class UpcomingWorks {
  final int? id;
  final int? productId;
  final int? serviceType;
  final String? vehicleNo;
  final String? vehicleType;
  final String? engineNo;
  final String? chassisNo;
  final String? deviceSerialNo;
  final String? customerName;
  final String? mobile;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? date;
  final String? camera;
  final int? speedGovernorId;
  final String? remarks;
  final String? totalAmount;
  final int? technicianId;
  final String? startTime;
  final String? endTime;
  final String? startLat;
  final String? startLong;
  final String? endLat;
  final String? endLong;
  final String? deviceId;
  final String? imei;
  final int? jobStatus;
  final int? isEnquiry;
  final String? cancellationStatus;
  final String? cancellationReason;
  final String? paymentType;
  final int? paymentStatus;
  final String? paymentId;
  final String? cashInHand;
  final String? cashOnline;
  final String? companyTitleId;
  final int? fromAiro;
  final int? rtoId;
  final String? installationDate;
  final String? invoiceNo;
  final String? certificationNo;
  final int? addedUser;
  final String? createdAt;
  final String? updatedAt;
  final String? technicianName;
  final String? productName;

  const UpcomingWorks({
    this.id,
    this.productId,
    this.serviceType,
    this.vehicleNo,
    this.vehicleType,
    this.engineNo,
    this.chassisNo,
    this.deviceSerialNo,
    this.customerName,
    this.mobile,
    this.location,
    this.latitude,
    this.longitude,
    this.date,
    this.camera,
    this.speedGovernorId,
    this.remarks,
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
    this.isEnquiry,
    this.cancellationStatus,
    this.cancellationReason,
    this.paymentType,
    this.paymentStatus,
    this.paymentId,
    this.cashInHand,
    this.cashOnline,
    this.companyTitleId,
    this.fromAiro,
    this.rtoId,
    this.installationDate,
    this.invoiceNo,
    this.certificationNo,
    this.addedUser,
    this.createdAt,
    this.updatedAt,
    this.technicianName,
    this.productName,
  });

  /// Factory constructor with null-aware operators
  factory UpcomingWorks.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const UpcomingWorks();
    return UpcomingWorks(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      serviceType: json['service_type'] as int?,
      vehicleNo: json['vehicle_no'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      engineNo: json['engine_no'] as String?,
      chassisNo: json['chassis_no'] as String?,
      deviceSerialNo: json['device_serial_no'] as String?,
      customerName: json['customer_name'] as String?,
      mobile: json['mobile'] as String?,
      location: json['location'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      date: json['date'] as String?,
      camera: json['camera'] as String?,
      speedGovernorId: json['speed_governor_id'] as int?,
      remarks: json['remarks'] as String?,
      totalAmount: json['total_amount'] as String?,
      technicianId: json['technician_id'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      startLat: json['start_lat'] as String?,
      startLong: json['start_long'] as String?,
      endLat: json['end_lat'] as String?,
      endLong: json['end_long'] as String?,
      deviceId: json['device_id'] as String?,
      imei: json['imei'] as String?,
      jobStatus: json['job_status'] as int?,
      isEnquiry: json['is_enquiry'] as int?,
      cancellationStatus: json['cancellation_status'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      paymentType: json['payment_type'] as String?,
      paymentStatus: json['payment_status'] as int?,
      paymentId: json['payment_id'] as String?,
      cashInHand: json['cash_in_hand'] as String?,
      cashOnline: json['cash_online'] as String?,
      companyTitleId: json['company_title_id'] as String?,
      fromAiro: json['from_airo'] as int?,
      rtoId: json['rto_id'] as int?,
      installationDate: json['installation_date'] as String?,
      invoiceNo: json['invoice_no'] as String?,
      certificationNo: json['certification_no'] as String?,
      addedUser: json['added_user'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      technicianName: json['technician_name'] as String?,
      productName: json['product_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'service_type': serviceType,
        'vehicle_no': vehicleNo,
        'vehicle_type': vehicleType,
        'engine_no': engineNo,
        'chassis_no': chassisNo,
        'device_serial_no': deviceSerialNo,
        'customer_name': customerName,
        'mobile': mobile,
        'location': location,
        'latitude': latitude,
        'longitude': longitude,
        'date': date,
        'camera': camera,
        'speed_governor_id': speedGovernorId,
        'remarks': remarks,
        'total_amount': totalAmount,
        'technician_id': technicianId,
        'start_time': startTime,
        'end_time': endTime,
        'start_lat': startLat,
        'start_long': startLong,
        'end_lat': endLat,
        'end_long': endLong,
        'device_id': deviceId,
        'imei': imei,
        'job_status': jobStatus,
        'is_enquiry': isEnquiry,
        'cancellation_status': cancellationStatus,
        'cancellation_reason': cancellationReason,
        'payment_type': paymentType,
        'payment_status': paymentStatus,
        'payment_id': paymentId,
        'cash_in_hand': cashInHand,
        'cash_online': cashOnline,
        'company_title_id': companyTitleId,
        'from_airo': fromAiro,
        'rto_id': rtoId,
        'installation_date': installationDate,
        'invoice_no': invoiceNo,
        'certification_no': certificationNo,
        'added_user': addedUser,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'technician_name': technicianName,
        'product_name': productName,
      };
}
