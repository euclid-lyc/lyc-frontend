import 'dart:io';

const emulatorIp = '10.0.2.2:8080';
const simulatorIp = '127.0.0.1:8080';
final ip = Platform.isIOS ? simulatorIp : emulatorIp;