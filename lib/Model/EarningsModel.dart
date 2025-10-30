class EarningsModel {
  bool? status;
  EarningsData? data;
  String? message;

  EarningsModel({
    this.status,
    this.data,
    this.message,
  });

  factory EarningsModel.fromJson(Map<String, dynamic>? json) {
    return EarningsModel(
      status: json?['status'] ?? false,
      data: json?['data'] != null
          ? EarningsData.fromJson(json?['data'])
          : null,
      message: json?['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status ?? false,
      'data': data?.toJson() ?? {},
      'message': message ?? '',
    };
  }
}

class EarningsData {
  List<EarningsByDate>? earningsByDate;
  num? totalEarnings;
  Pagination? pagination;
  DateRange? dateRange;

  EarningsData({
    this.earningsByDate,
    this.totalEarnings,
    this.pagination,
    this.dateRange,
  });

  factory EarningsData.fromJson(Map<String, dynamic>? json) {
    return EarningsData(
      earningsByDate: (json?['earnings_by_date'] as List?)
          ?.map((e) => EarningsByDate.fromJson(e ?? {}))
          .toList() ??
          [],
      totalEarnings: json?['total_earnings'] ?? 0,
      pagination: json?['pagination'] != null
          ? Pagination.fromJson(json?['pagination'])
          : null,
      dateRange: json?['date_range'] != null
          ? DateRange.fromJson(json?['date_range'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'earnings_by_date':
      earningsByDate?.map((e) => e.toJson()).toList() ?? [],
      'total_earnings': totalEarnings ?? 0,
      'pagination': pagination?.toJson() ?? {},
      'date_range': dateRange?.toJson() ?? {},
    };
  }
}

class EarningsByDate {
  String? date;
  List<Earnings>? earnings;
  num? totalAmount;
  int? count;

  EarningsByDate({
    this.date,
    this.earnings,
    this.totalAmount,
    this.count,
  });

  factory EarningsByDate.fromJson(Map<String, dynamic>? json) {
    return EarningsByDate(
      date: json?['date'] ?? '',
      earnings: (json?['earnings'] as List?)
          ?.map((e) => Earnings.fromJson(e ?? {}))
          .toList() ??
          [],
      totalAmount: json?['total_amount'] ?? 0,
      count: json?['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date ?? '',
      'earnings': earnings?.map((e) => e.toJson()).toList() ?? [],
      'total_amount': totalAmount ?? 0,
      'count': count ?? 0,
    };
  }
}

class Earnings {
  int? id;
  int? type;
  int? jobId;
  int? technicianId;
  String? amount;
  String? createdAt;
  int? productId;
  String? customerName;
  String? productName;
  String? location;
  String? latitude;
  String? longitude;

  Earnings({
    this.id,
    this.type,
    this.jobId,
    this.technicianId,
    this.amount,
    this.createdAt,
    this.productId,
    this.customerName,
    this.productName,
    this.location,
    this.latitude,
    this.longitude,
  });

  factory Earnings.fromJson(Map<String, dynamic>? json) {
    return Earnings(
      id: json?['id'] ?? 0,
      type: json?['type'] ?? 0,
      jobId: json?['job_id'] ?? 0,
      technicianId: json?['technician_id'] ?? 0,
      amount: json?['amount']?.toString() ?? '',
      createdAt: json?['created_at'] ?? '',
      productId: json?['product_id'] ?? 0,
      customerName: json?['customer_name'] ?? '',
      productName: json?['product_name'] ?? '',
      location: json?['location'] ?? '',
      latitude: json?['latitude']?.toString() ?? '',
      longitude: json?['longitude']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'type': type ?? 0,
      'job_id': jobId ?? 0,
      'technician_id': technicianId ?? 0,
      'amount': amount ?? '',
      'created_at': createdAt ?? '',
      'product_id': productId ?? 0,
      'customer_name': customerName ?? '',
      'product_name': productName ?? '',
      'location': location ?? '',
      'latitude': latitude ?? '',
      'longitude': longitude ?? '',
    };
  }
}

class Pagination {
  String? currentPage;
  String? perPage;
  int? total;
  int? lastPage;
  bool? hasMore;

  Pagination({
    this.currentPage,
    this.perPage,
    this.total,
    this.lastPage,
    this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic>? json) {
    return Pagination(
      currentPage: json?['current_page']?.toString() ?? '',
      perPage: json?['per_page']?.toString() ?? '',
      total: json?['total'] ?? 0,
      lastPage: json?['last_page'] ?? 0,
      hasMore: json?['has_more'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage ?? '',
      'per_page': perPage ?? '',
      'total': total ?? 0,
      'last_page': lastPage ?? 0,
      'has_more': hasMore ?? false,
    };
  }
}

class DateRange {
  String? from;
  String? to;

  DateRange({
    this.from,
    this.to,
  });

  factory DateRange.fromJson(Map<String, dynamic>? json) {
    return DateRange(
      from: json?['from'] ?? '',
      to: json?['to'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from ?? '',
      'to': to ?? '',
    };
  }
}
