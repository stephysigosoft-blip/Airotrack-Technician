class CompanyTitleModel {
  final bool? status;
  final List<CompanyData>? data;
  final String? message;

  CompanyTitleModel({
    this.status,
    this.data,
    this.message,
  });

  factory CompanyTitleModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CompanyTitleModel();

    return CompanyTitleModel(
      status: json['status'] as bool?,
      data: (json['data'] as List?)
          ?.map((e) => CompanyData.fromJson(e as Map<String, dynamic>?))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }
}

class CompanyData {
  final int? id;
  final String? title;

  CompanyData({this.id, this.title});

  factory CompanyData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CompanyData();

    return CompanyData(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
