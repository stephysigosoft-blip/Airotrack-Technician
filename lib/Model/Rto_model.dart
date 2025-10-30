class RTOModel {
  final bool? status;
  final List<RTOData>? data;
  final String? message;

  RTOModel({
    this.status,
    this.data,
    this.message,
  });

  factory RTOModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RTOModel();

    return RTOModel(
      status: json['status'] as bool?,
      data: (json['data'] as List?)
              ?.map((item) => RTOData.fromJson(item as Map<String, dynamic>?))
              .toList() ??
          [],
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status ?? false,
      'data': data?.map((item) => item.toJson()).toList() ?? [],
      'message': message ?? '',
    };
  }
}

class RTOData {
  final int? id;
  final String? rtoCode;
  final String? rtoName;

  RTOData({
    this.id,
    this.rtoCode,
    this.rtoName,
  });

  factory RTOData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RTOData();

    return RTOData(
      id: json['id'] is int ? json['id'] as int : int.tryParse(json['id']?.toString() ?? ''),
      rtoCode: json['rto_code']?.toString() ?? '',
      rtoName: json['rto_name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'rto_code': rtoCode ?? '',
      'rto_name': rtoName ?? '',
    };
  }
}
