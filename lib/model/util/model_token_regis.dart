class ModelRegis{
  final String salesCode, serialPin, deviceId, deviceName, version;

  ModelRegis({
    required this.salesCode, 
    required this.serialPin, 
    required this.deviceId,
    required this.deviceName,
    required this.version
  });

  Map<String, dynamic> toJson() => {
    'sales_code': salesCode,
    'serial_pin': serialPin,
    'device_id': deviceId,
    'device_name': deviceName,
    'version': version,
  };
}