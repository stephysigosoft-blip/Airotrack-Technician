class RecentJobsModel {
  bool? status;
  RecentJobsData? data;
  String? message;

  RecentJobsModel({this.status, this.data, this.message});

  factory RecentJobsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RecentJobsModel();
    return RecentJobsModel(
      status: json['status'] ?? false,
      data: json['data'] != null ? RecentJobsData.fromJson(json['data']) : null,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status ?? false,
    'data': data?.toJson() ?? {},
    'message': message ?? '',
  };
}

class RecentJobsData {
  List<RecentJobsDateData>? data;
  Pagination? pagination;

  RecentJobsData({this.data, this.pagination});

  factory RecentJobsData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RecentJobsData();
    return RecentJobsData(
      data: (json['data'] as List?)
          ?.map((e) => RecentJobsDateData.fromJson(e))
          .toList() ??
          [],
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList() ?? [],
    'pagination': pagination?.toJson() ?? {},
  };
}

class RecentJobsDateData {
  String? date;
  List<Job>? jobs;
  int? count;

  RecentJobsDateData({this.date, this.jobs, this.count});

  factory RecentJobsDateData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RecentJobsDateData();
    return RecentJobsDateData(
      date: json['date'] ?? '',
      jobs: (json['jobs'] as List?)?.map((e) => Job.fromJson(e)).toList() ?? [],
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'date': date ?? '',
    'jobs': jobs?.map((e) => e.toJson()).toList() ?? [],
    'count': count ?? 0,
  };
}

class Job {
  int? productId;
  int? serviceType;
  String? serviceTypeText;
  String? customerName;
  String? totalAmount;
  String? mobile;
  String? location;
  String? latitude;
  String? longitude;
  String? date;
  String? technicianName;
  String? productName;
  int? technicianId;
  int? jobStatus;
  int? paymentType;
  String? paymentId;

  Job({
    this.productId,
    this.serviceType,
    this.serviceTypeText,
    this.customerName,
    this.totalAmount,
    this.mobile,
    this.location,
    this.latitude,
    this.longitude,
    this.date,
    this.technicianName,
    this.productName,
    this.technicianId,
    this.jobStatus,
    this.paymentType,
    this.paymentId,
  });

  factory Job.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Job();
    return Job(
      productId: json['product_id'] ?? 0,
      serviceType: json['service_type'] ?? 0,
      serviceTypeText: json['service_type_text'] ?? '',
      customerName: json['customer_name'] ?? '',
      totalAmount: json['total_amount'] ?? '',
      mobile: json['mobile'] ?? '',
      location: json['location'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      date: json['date'] ?? '',
      technicianName: json['technician_name'] ?? '',
      productName: json['product_name'] ?? '',
      technicianId: json['technician_id'] ?? 0,
      jobStatus: json['job_status'] ?? 0,
      paymentType: json['payment_type'] ?? 0,
      paymentId: json['payment_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'product_id': productId ?? 0,
    'service_type': serviceType ?? 0,
    'service_type_text': serviceTypeText ?? '',
    'customer_name': customerName ?? '',
    'total_amount': totalAmount ?? '',
    'mobile': mobile ?? '',
    'location': location ?? '',
    'latitude': latitude ?? '',
    'longitude': longitude ?? '',
    'date': date ?? '',
    'technician_name': technicianName ?? '',
    'product_name': productName ?? '',
    'technician_id': technicianId ?? 0,
    'job_status': jobStatus ?? 0,
    'payment_type': paymentType ?? 0,
    'payment_id': paymentId ?? '',
  };
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? total;
  int? lastPage;

  Pagination({this.currentPage, this.perPage, this.total, this.lastPage});

  factory Pagination.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Pagination();
    return Pagination(
      currentPage: json['current_page'] ?? 0,
      perPage: json['per_page'] ?? 0,
      total: json['total'] ?? 0,
      lastPage: json['last_page'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'current_page': currentPage ?? 0,
    'per_page': perPage ?? 0,
    'total': total ?? 0,
    'last_page': lastPage ?? 0,
  };
}
