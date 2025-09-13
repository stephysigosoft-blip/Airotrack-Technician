class WorkDetailsModel {
  final String? status;
  final WorkDetailsData? data;
  final String? message;

  WorkDetailsModel({
    this.status,
    this.data,
    this.message,
  });

  factory WorkDetailsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkDetailsModel();
    
    return WorkDetailsModel(
      status: json['status']?.toString(),
      data: json['data'] != null ? WorkDetailsData.fromJson(json['data']) : null,
      message: json['message']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'message': message,
    };
  }
}

class WorkDetailsData {
  final WorkDetailsDetails? details;

  WorkDetailsData({
    this.details,
  });

  factory WorkDetailsData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkDetailsData();
    
    return WorkDetailsData(
      details: json['details'] != null ? WorkDetailsDetails.fromJson(json['details']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details?.toJson(),
    };
  }
}

class WorkDetailsDetails {
  final int? productId;
  final int? serviceType;
  final String? customerName;
  final String? totalAmount;
  final String? mobile;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? date;
  final String? technicianName;
  final String? technicianMobile;
  final String? countryCode;
  final String? productName;
  final int? technicianId;
  final String? vehicleNo;
  final int? jobStatus;
  final String? paymentType;
  final String? paymentId;
  final String? startTime;
  final String? endTime;
  final String? deviceId;
  final String? deviceSerialNo;
  final String? engineNo;
  final String? chassisNo;
  final String? vehicleType;
  final String? imei;
  final int? workDurationMinutes;
  final String? workDurationFormatted;
  final WorkDetailsImages? images;
  final String? earning;

  WorkDetailsDetails({
    this.productId,
    this.serviceType,
    this.customerName,
    this.totalAmount,
    this.mobile,
    this.location,
    this.latitude,
    this.longitude,
    this.date,
    this.technicianName,
    this.technicianMobile,
    this.countryCode,
    this.productName,
    this.technicianId,
    this.vehicleNo,
    this.jobStatus,
    this.paymentType,
    this.paymentId,
    this.startTime,
    this.endTime,
    this.deviceId,
    this.deviceSerialNo,
    this.engineNo,
    this.chassisNo,
    this.vehicleType,
    this.imei,
    this.workDurationMinutes,
    this.workDurationFormatted,
    this.images,
    this.earning,
  });

  factory WorkDetailsDetails.fromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkDetailsDetails();
    
    return WorkDetailsDetails(
      productId: json['product_id'] is int 
          ? json['product_id'] 
          : int.tryParse(json['product_id']?.toString() ?? ''),
      serviceType: json['service_type'] is int 
          ? json['service_type'] 
          : int.tryParse(json['service_type']?.toString() ?? ''),
      customerName: json['customer_name']?.toString(),
      totalAmount: json['total_amount']?.toString(),
      mobile: json['mobile']?.toString(),
      location: json['location']?.toString(),
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
      date: json['date']?.toString(),
      technicianName: json['technician_name']?.toString(),
      technicianMobile: json['technician_mobile']?.toString(),
      countryCode: json['country_code']?.toString(),
      productName: json['product_name']?.toString(),
      technicianId: json['technician_id'] is int 
          ? json['technician_id'] 
          : int.tryParse(json['technician_id']?.toString() ?? ''),
      vehicleNo: json['vehicle_no']?.toString(),
      jobStatus: json['job_status'] is int 
          ? json['job_status'] 
          : int.tryParse(json['job_status']?.toString() ?? ''),
      paymentType: json['payment_type']?.toString(),
      paymentId: json['payment_id']?.toString(),
      startTime: json['start_time']?.toString(),
      endTime: json['end_time']?.toString(),
      deviceId: json['device_id']?.toString(),
      deviceSerialNo: json['device_serial_no']?.toString(),
      engineNo: json['engine_no']?.toString(),
      chassisNo: json['chassis_no']?.toString(),
      vehicleType: json['vehicle_type']?.toString(),
      imei: json['imei']?.toString(),
      workDurationMinutes: json['work_duration_minutes'] is int 
          ? json['work_duration_minutes'] 
          : int.tryParse(json['work_duration_minutes']?.toString() ?? ''),
      workDurationFormatted: json['work_duration_formatted']?.toString(),
      images: json['images'] != null ? WorkDetailsImages.fromJson(json['images']) : null,
      earning: json['earning']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'service_type': serviceType,
      'customer_name': customerName,
      'total_amount': totalAmount,
      'mobile': mobile,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'date': date,
      'technician_name': technicianName,
      'technician_mobile': technicianMobile,
      'country_code': countryCode,
      'product_name': productName,
      'technician_id': technicianId,
      'vehicle_no': vehicleNo,
      'job_status': jobStatus,
      'payment_type': paymentType,
      'payment_id': paymentId,
      'start_time': startTime,
      'end_time': endTime,
      'device_id': deviceId,
      'device_serial_no': deviceSerialNo,
      'engine_no': engineNo,
      'chassis_no': chassisNo,
      'vehicle_type': vehicleType,
      'work_duration_minutes': workDurationMinutes,
      'work_duration_formatted': workDurationFormatted,
      'images': images?.toJson(),
      'earning': earning,
    };
  }
}

class WorkDetailsImages {
  final int? id;
  final int? jobId;
  final String? deviceImage;
  final String? rcImage;
  final String? capturedImage;
  final String? vehicleImage;
  final String? createdAt;
  final String? updatedAt;

  WorkDetailsImages({
    this.id,
    this.jobId,
    this.deviceImage,
    this.rcImage,
    this.capturedImage,
    this.vehicleImage,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkDetailsImages.fromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkDetailsImages();
    
    return WorkDetailsImages(
      id: json['id'] is int 
          ? json['id'] 
          : int.tryParse(json['id']?.toString() ?? ''),
      jobId: json['job_id'] is int 
          ? json['job_id'] 
          : int.tryParse(json['job_id']?.toString() ?? ''),
      deviceImage: json['device_image']?.toString(),
      rcImage: json['rc_image']?.toString(),
      capturedImage: json['captured_image']?.toString(),
      vehicleImage: json['vehicle_image']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'job_id': jobId,
      'device_image': deviceImage,
      'rc_image': rcImage,
      'captured_image': capturedImage,
      'vehicle_image': vehicleImage,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}