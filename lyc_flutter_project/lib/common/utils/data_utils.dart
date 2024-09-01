import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/const/data.dart';

class DataUtils {
  // reponse로 받은 imgUrl에 적용합니다
  static pathToUrl(String path) {
    return "http://$ip/$path";
  }

  static listPathsToUrl(List<String> paths) {
    return paths.map((e) => pathToUrl(e)).toList();
  }

  static xfileToUrl(XFile image) async {
    final bytes = await File(image.path).readAsBytes();
    return base64Encode(bytes);
  }
}
