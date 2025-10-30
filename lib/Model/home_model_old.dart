class HomeData {
  int id;
  String userName;
  dynamic email;
  String mobile;
  String address;
  dynamic companyName;
  int roleId;
  int status;
  int regStatus;
  dynamic countryCodeId;
  dynamic profileImg;
  int addedBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String firstName;
  dynamic lastName;
  String rtoTradeCertificateNo;

  HomeData({
    required this.id,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.companyName,
    required this.roleId,
    required this.status,
    required this.regStatus,
    required this.countryCodeId,
    required this.profileImg,
    required this.addedBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    required this.lastName,
    required this.rtoTradeCertificateNo,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        id: (json["id"] is int)
            ? json["id"] as int
            : int.tryParse((json["id"])?.toString() ?? "") ?? 0,
        userName: (json["user_name"] ?? json["username"] ?? json["name"])
                ?.toString() ??
            "",
        email: json["email"],
        mobile: (json["mobile"] ?? json["mobile_no"] ?? json["phone"])
                ?.toString() ??
            "",
        address: (json["address"])?.toString() ?? "",
        companyName: json["company_name"] ?? json["companyName"],
        roleId: (json["role_id"] is int)
            ? json["role_id"] as int
            : int.tryParse((json["role_id"])?.toString() ?? "") ?? 0,
        status: (json["status"] is int)
            ? json["status"] as int
            : int.tryParse((json["status"])?.toString() ?? "") ?? 0,
        regStatus: (json["reg_status"] is int)
            ? json["reg_status"] as int
            : int.tryParse((json["reg_status"])?.toString() ?? "") ?? 0,
        countryCodeId: json["country_code_id"],
        profileImg: json["profile_img"],
        addedBy: (json["added_by"] is int)
            ? json["added_by"] as int
            : int.tryParse((json["added_by"])?.toString() ?? "") ?? 0,
        updatedBy: json["updated_by"],
        createdAt: DateTime.tryParse((json["created_at"])?.toString() ?? "") ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt: DateTime.tryParse((json["updated_at"])?.toString() ?? "") ??
            DateTime.fromMillisecondsSinceEpoch(0),
        firstName:
            (json["first_name"] ?? json["firstname"] ?? json["firstName"])
                    ?.toString() ??
                "",
        lastName: json["last_name"] ?? json["lastname"] ?? json["lastName"],
        rtoTradeCertificateNo:
            (json["rto_trade_certificate_no"])?.toString() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "email": email,
        "mobile": mobile,
        "address": address,
        "company_name": companyName,
        "role_id": roleId,
        "status": status,
        "reg_status": regStatus,
        "country_code_id": countryCodeId,
        "profile_img": profileImg,
        "added_by": addedBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "first_name": firstName,
        "last_name": lastName,
        "rto_trade_certificate_no": rtoTradeCertificateNo,
      };
}
