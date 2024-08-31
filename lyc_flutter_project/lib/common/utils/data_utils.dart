import 'package:lyc_flutter_project/common/const/data.dart';

// reponse로 받은 imgUrl에 적용합니다
class DataUtils {
  static pathToUrl(String path) {
    return "http://$ip/$path";
  }
  static listPathsToUrl(List<String> paths) {
    return paths.map((e) => pathToUrl(e)).toList();
  }
}