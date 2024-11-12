import 'package:flutter/foundation.dart' as foundation;
const emulatorIp = '3.37.8.250:8080';
const simulatorIp = '3.37.8.250:8080';
final ip = foundation.kIsWeb ? simulatorIp : (foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS ? simulatorIp : emulatorIp);
//const ip =  "172.30.1.36:8080";


const accessTokenKey = 'ACCESS_TOKEN';
const refreshTokenKey = 'REFRESH_TO|KEN';