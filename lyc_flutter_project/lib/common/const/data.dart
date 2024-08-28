import 'dart:io';

const emulatorIp = '10.0.2.2:3000';
const simulatorIp = '127.0.0.1:3000';
final ip = Platform.isIOS ? simulatorIp : emulatorIp;