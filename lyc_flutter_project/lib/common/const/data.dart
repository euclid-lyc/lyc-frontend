import 'package:flutter/foundation.dart' as foundation;
const emulatorIp = '10.0.2.2:8080';
const simulatorIp = '127.0.0.1:8080';
final ip = foundation.kIsWeb ? simulatorIp : (foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS ? simulatorIp : emulatorIp);
// final ip ="172.21.100.86:8080";
const accessTokenKey = 'ACCESS_TOKEN';
const refreshTokenKey = 'REFRESH_TOKEN';