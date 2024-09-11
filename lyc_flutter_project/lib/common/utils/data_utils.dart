import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/const/data.dart';

class DataUtils {
  static pathToUrl(String path) {
    return "http://$ip/$path";
  }

  static listPathsToUrl(List<String> paths) {
    return paths.map((e) => pathToUrl(e)).toList();
  }

  static Future<String> xfileToUrl(XFile image) async {
    final bytes = await File(image.path).readAsBytes();
    return base64Encode(bytes);
  }

  static Future<MultipartFile> pathToMultipart(String image) async {
    final file = await MultipartFile.fromFile(image);
    return file;
  }
}
