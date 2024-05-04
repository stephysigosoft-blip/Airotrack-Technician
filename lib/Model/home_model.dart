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
        id: json["id"],
        userName: json["user_name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
        companyName: json["company_name"],
        roleId: json["role_id"],
        status: json["status"],
        regStatus: json["reg_status"],
        countryCodeId: json["country_code_id"],
        profileImg: json["profile_img"],
        addedBy: json["added_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        rtoTradeCertificateNo: json["rto_trade_certificate_no"],
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
