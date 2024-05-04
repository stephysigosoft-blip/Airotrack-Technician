class Command {
  int id;
  String command;

  Command({
    required this.id,
    required this.command,
  });

  factory Command.fromJson(Map<String, dynamic> json) => Command(
        id: json["id"],
        command: json["command"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "command": command,
      };
}

class DeviceDetails {
  int id;
  String imei;
  dynamic firmwareVersion;
  int power;
  int gnssFix;
  int gsmSignalStrength;
  int ignition;
  String primaryMobileNumber;
  String secondaryMobileNumber;
  String networkProvider;
  String simProvider;
  String simActivationDate;
  String expirationtime;
  String latitude;
  String longitude;
  String alertId;
  String deviceModel;

  DeviceDetails({
    required this.id,
    required this.imei,
    required this.firmwareVersion,
    required this.power,
    required this.gnssFix,
    required this.gsmSignalStrength,
    required this.ignition,
    required this.primaryMobileNumber,
    required this.secondaryMobileNumber,
    required this.networkProvider,
    required this.simProvider,
    required this.simActivationDate,
    required this.expirationtime,
    required this.latitude,
    required this.longitude,
    required this.alertId,
    required this.deviceModel,
  });

  factory DeviceDetails.fromJson(Map<String, dynamic> json) => DeviceDetails(
        id: json["id"],
        imei: json["imei"],
        firmwareVersion: json["firmware_version"],
        power: json["power"],
        gnssFix: json["gnss_fix"],
        gsmSignalStrength: json["gsm_signal_strength"],
        ignition: json["ignition"],
        primaryMobileNumber: json["primary_mobile_number"] == null
            ? ""
            : json["primary_mobile_number"].toString(),
        secondaryMobileNumber: json["secondary_mobile_number"] == null
            ? ""
            : json["secondary_mobile_number"].toString(),
        networkProvider: json["network_provider"] == null
            ? ""
            : json["network_provider"].toString(),
        simProvider:
            json["sim_provider"] == null ? "" : json["sim_provider"].toString(),
        simActivationDate: json["sim_activation_date"] == null
            ? ""
            : json["sim_activation_date"].toString(),
        expirationtime: json["expirationtime"] == null
            ? ""
            : json["expirationtime"].toString(),
        latitude: json["latitude"],
        longitude: json["longitude"],
        alertId: json["alert_id"],
        deviceModel: json["device_model"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imei": imei,
        "firmware_version": firmwareVersion,
        "power": power,
        "gnss_fix": gnssFix,
        "gsm_signal_strength": gsmSignalStrength,
        "ignition": ignition,
        "primary_mobile_number": primaryMobileNumber,
        "secondary_mobile_number": secondaryMobileNumber,
        "network_provider": networkProvider,
        "sim_provider": simProvider,
        "sim_activation_date": simActivationDate,
        "expirationtime": expirationtime,
        "latitude": latitude,
        "longitude": longitude,
        "alert_id": alertId,
        "device_model": deviceModel,
      };
}
